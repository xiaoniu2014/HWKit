//
//  UIImage+JMCAdd.h
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (JMCAdd)

/**获取启动图*/
+ (UIImage *)jmc_launchImage;

/**图片切成正方形*/
- (UIImage *)jmc_squareCrop;
@end
