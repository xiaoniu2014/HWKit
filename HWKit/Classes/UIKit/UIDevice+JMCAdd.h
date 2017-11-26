//
//  UIDevice+JMCAdd.h
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import <UIKit/UIKit.h>

/*!
 *  随机生成唯一id
 */
extern NSString * const JMCGeneralUUID();
/**
 *  生成UUID
 *  @discussion 格式如下:
 *          2B064C33-149B-43A6-A506-33066B49AED2
 F017D24F-5CF2-4C17-B71C-CCA5FA1CA87D
 *  @return UUID
 */
extern NSString * const JMCGeneralUUIDString();


@interface UIDevice (JMCAdd)

/**是否破解*/
+ (BOOL)jmc_isCracked;
/**是否越狱*/
+ (BOOL)jmc_isJailbroken;
/**ip*/
+ (NSString *)jmc_deviceIPAddress;
/**mac地址*/
+ (NSString *)jmc_macAddress;

+ (NSString *)jmc_platform;
+ (NSString *)jmc_platformString;

+ (NSString *)jmc_deviceName;
+ (NSString *)jmc_deviceModel;
+ (NSString *)jmc_deviceLocalizedModel;
+ (NSString *)jmc_systemName;
+ (NSString *)jmc_systemVersion;

+ (NSString *)jmc_appName;
+ (NSString *)jmc_appVersion;
+ (NSString *)jmc_buildVersion;

+ (NSString *)jmc_language;
+ (NSString *)jmc_country;

/** 建议使用异步操作，因为同步计算非常耗时 */
+ (NSDictionary *)jmc_fileSystemInfo;
+ (NSDictionary *)jmc_memoryInfo;

@end
