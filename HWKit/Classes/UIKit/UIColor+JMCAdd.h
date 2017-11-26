//
//  UIColor+JMCAdd.h
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JMCAdd)

/*!
 *  产生随机颜色
 */
extern UIColor * const JMCRandomColor(CGFloat alpha);

/*!
 *  自定义的颜色
 *  @param r     红
 *  @param g     绿
 *  @param b     蓝
 *  @param alpha 透明度
 */
extern UIColor * const JMCCustomColor(CGFloat r,CGFloat g, CGFloat b, CGFloat alpha);

/*!
 *Creates and returns a color object from hex string.
 */
+ (nullable UIColor *)jmc_colorWithHexString:(NSString *)hexStr;
/*
 * 生成纯色图片
 */
- (UIImage *)jmc_convertToImage;
@end
NS_ASSUME_NONNULL_END
