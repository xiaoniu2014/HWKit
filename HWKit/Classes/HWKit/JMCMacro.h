//
//  JMCMacro.h
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#ifndef JMCMacro_h
#define JMCMacro_h

#ifdef DEBUG
#define JMCLog(format, ...) NSLog((@"%s (%@:Line %d) " format), \
__PRETTY_FUNCTION__, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,\
## __VA_ARGS__)
#else
#define JMCLog(format, ...)
#endif

#define WeakSelf(weakSelf)                          __weak __typeof(&*self)weakSelf = self;
#define StrongSelf(strongSelf, weakSelf)            __strong __typeof(&*self)strongSelf = weakSelf;

#define kScreenW                    ([[UIScreen mainScreen] bounds].size.width)
#define kScreenH                    ([[UIScreen mainScreen] bounds].size.height)
#define kScreenMaxLength            (MAX(kScreenW, kScreenH))
#define kScreenMinLength            (MIN(kScreenW, kScreenH))

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define UIColorFromHex(hexValue) \
[UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(hexValue & 0x0000FF))/255.0 \
alpha:1.0]

#endif /* JMCMacro_h */
