//
//  UIColor+JMCAdd.m
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import "UIColor+JMCAdd.h"

@implementation UIColor (JMCAdd)

UIColor * const JMCRandomColor(CGFloat alpha) {
    
    srand((unsigned) time(NULL)); //用时间做种，使每次产生随机数不一样
    
    CGFloat realAlpha = alpha;
    if (alpha < 0.0 || alpha > 1.0) {
        realAlpha = rand() % 10000 / 10000.0;
    }
    
    CGFloat r = rand() % 256; //红
    
    CGFloat g = rand() % 256; //绿
    
    CGFloat b = rand() % 256; //蓝
    
    return JMCCustomColor(r, g, b, realAlpha);
}

UIColor * const JMCCustomColor(CGFloat r,CGFloat g, CGFloat b, CGFloat alpha) {
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:alpha];
}


+ (UIColor *)jmc_colorWithHexString:(NSString *)hexStr {
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [UIColor jmc_colorWithRGBHex:hexNum];
}

+ (UIColor *)jmc_colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    return JMCCustomColor(r, g, b, 1.0f);
}

- (UIImage *)jmc_convertToImage {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
