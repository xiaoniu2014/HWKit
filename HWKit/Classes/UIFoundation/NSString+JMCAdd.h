//
//  NSString+JMCAdd.h
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import <UIKit/UIKit.h>

/**
 *  判断两个字符串是否相等
 */
extern BOOL JMCIsEqualToString(NSString * aStr , NSString * bStr);


@interface NSString (JMCAdd)
- (BOOL)jmc_isEmpty;
/**判断是否为整形*/
- (BOOL)jmc_isPureInt;
/**判断是否为浮点形*/
- (BOOL)jmc_isPureFloat;
/**判断是否为纯数字*/
- (BOOL)jmc_isPureNumber;

/**判断是否只有数字和字符串*/
- (BOOL)jmc_isLettersNumbers;
/**是否包含emoji*/
- (BOOL)jmc_isContainsEmoji;
/**是否包含subStr*/
- (BOOL)jmc_isContainsString:(NSString *)subStr;
/**sha1加密*/
- (NSString *)jmc_sha1;
/**md5加密*/
- (NSString *)jmc_md5;
/**汉字转拼音*/
- (NSString *)jmc_transformToPinyin;
/**固定宽度，计算高度*/
- (CGSize)jmc_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;
/**固定高度，计算宽度*/
- (CGSize)jmc_sizeWithFont:(UIFont *)font maxHeight:(CGFloat)maxHeight;
/** NSString以某种类型转换成date*/
- (NSDate *)jmc_dateWithformate:(NSString *)fromate;
/** NSString转NSDate,格式yyyy-MM-dd HH:mm:ss*/
- (NSDate *)jmc_date;
@end
