//
//  JMCRuntimeHelper.h
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import <Foundation/Foundation.h>

@interface JMCRuntimeHelper : NSObject

/*
 * 获取对象的所有属性的名称
 * 属性是指通过@property声明
 */
NSDictionary *getPropertyListOfObject(NSObject *obj);

/*
 * 获取类的所有属性的名称
 * 属性是指通过@property声明, 但父类的属性无法获取
 */
NSDictionary *getPropertyListOfClass(Class cls);

/*
 * 实例方法/类方法交互新方法
 */
void hookSelector(Class cls, SEL origSEL, SEL newSEL);

@end
