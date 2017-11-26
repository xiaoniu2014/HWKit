//
//  UIImage+JMCAdd.m
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import "UIImage+JMCAdd.h"

@implementation UIImage (JMCAdd)

+ (UIImage *)jmc_launchImage {
    UIImage *launchImage = nil;
    
    NSArray *launchImages = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *itemDict in launchImages) {
        if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeFromString(itemDict[@"UILaunchImageSize"]))) {
            launchImage = [UIImage imageNamed:itemDict[@"UILaunchImageName"]];
            break;
        }
    }
    
    return launchImage;
}

- (UIImage *)jmc_squareCrop{
    // Get size of current image
    CGSize size = [self size];
    
    // Create rectangle that represents a cropped image
    CGFloat desiredRatio = 1;
    CGFloat croppedWidth = 0.0;
    CGFloat croppedHeight = 0.0;
    
    CGRect rect;
    if (size.height/size.width >= desiredRatio) {
        croppedWidth = size.width;
        croppedHeight = size.width * desiredRatio;
        CGFloat difference = (size.height - croppedHeight) / 2;
        rect = CGRectMake(0.0, difference ,croppedWidth, croppedHeight);
    } else {
        return self;
    }
    
    // Create bitmap image from original image data,
    // using rectangle to specify desired crop area
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

@end
