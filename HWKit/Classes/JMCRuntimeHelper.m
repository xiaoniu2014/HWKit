//
//  JMCRuntimeHelper.m
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import "JMCRuntimeHelper.h"
#import <objc/runtime.h>

@implementation JMCRuntimeHelper

NSDictionary *getPropertyListOfObject(NSObject *obj) {
    NSCParameterAssert(obj);
    return getPropertyListOfClass([obj class]);
}

NSDictionary *getPropertyListOfClass(Class cls) {
    NSCParameterAssert(cls);
    
    NSMutableDictionary *propertyDic = [NSMutableDictionary dictionary];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        const char *propType = property_getAttributes(property);
        
        if (propType && propName) {
            NSArray *anAttribute = [[NSString stringWithUTF8String:propType] componentsSeparatedByString:@","];
            NSString *aType = anAttribute[0];
            
            [propertyDic setObject:aType forKey:[NSString stringWithUTF8String:propName]];
        }
    }
    free(properties);
    
    return propertyDic;
}

void hookSelector(Class cls, SEL origSEL, SEL newSEL) {
    NSCParameterAssert(cls);
    NSCParameterAssert(origSEL);
    NSCParameterAssert(newSEL);
    
    Method origMethod = class_getInstanceMethod(cls, origSEL);
    Method newMethod = nil;
    
    if (origMethod) {
        newMethod = class_getInstanceMethod(cls, newSEL);
        if (!newMethod) return;
    }
    else {
        origMethod = class_getClassMethod(cls, origSEL);
        if (!origMethod) return;
        
        newMethod = class_getClassMethod(cls, newSEL);
        if (!newMethod) return;
    }
    
    
    BOOL hasMethod = class_addMethod(cls, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (hasMethod) {
        class_replaceMethod(cls, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

@end
