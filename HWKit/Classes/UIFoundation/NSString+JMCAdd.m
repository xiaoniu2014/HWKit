//
//  NSString+JMCAdd.m
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import "NSString+JMCAdd.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (JMCAdd)

BOOL JMCIsEqualToString(NSString * aStr , NSString * bStr) {
    if ([aStr isKindOfClass:[NSString class]] &&
        [bStr isKindOfClass:[NSString class]]) {
        return [aStr isEqualToString:bStr];
    } else {
        /*
         因为此方法是判断字符串是否相等的，所以如果都不是字符串就直接返回NO
         */
        return NO;
    }
}

- (BOOL)jmc_isEmpty {
    if (self == nil) {
        return YES;
    }
    
    if ([self isKindOfClass:[NSNumber class]]) {
        NSNumber *tmpNum = (NSNumber *)self;
        NSString *tmpStr = [tmpNum stringValue];
        
        if (tmpStr == nil) {
            return YES;
        }
        return NO;
    }
    
    if ((NSNull *) self == [NSNull null]) {
        return YES;
    }
    
    if ([self isEqual: @"(null)"]) {
        return YES;
    }
    
    if ([self isEqualToString:@"null"]) {
        return YES;
    }
    
    if ([self length] == 0) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
}

/**判断是否为整形*/
- (BOOL)jmc_isPureInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/**判断是否为浮点形*/
- (BOOL)jmc_isPureFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

/**判断是否为纯数字*/
- (BOOL)jmc_isPureNumber {
    if(![self jmc_isPureInt] || ![self jmc_isPureFloat]) return NO;
    return YES;
}
/**判断是否只有数字和字符串*/
- (BOOL)jmc_isLettersNumbers {
    NSString *regex = @"^[a-zA-Z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:self] == YES) {
        return YES;
    } else{
        return NO;
    }
}

- (BOOL)jmc_isContainsEmoji {
    __block BOOL isEomji = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange,BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     isEomji = YES;
                 }
                 
             }
             
         } else if (substring.length > 1) {
             
             const unichar ls = [substring characterAtIndex:1];
             
             if (ls == 0x20e3) {
                 
                 isEomji = YES;
                 
             }
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 
                 isEomji = YES;
                 
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 
                 isEomji = YES;
                 
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 
                 isEomji = YES;
                 
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 
                 isEomji = YES;
                 
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030|| hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs ==0x231a ) {
                 
                 isEomji = YES;
             }
         }
     }];
    return isEomji;
}

- (BOOL)jmc_isContainsString:(NSString *)subStr {
    NSRange range = [self rangeOfString:subStr];
    BOOL found = (range.location != NSNotFound);
    return found;
}

- (NSString *)jmc_sha1 {
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

- (NSString *)jmc_md5 {
    const char *cStr = [self UTF8String];//转换成utf-8
    unsigned char result[16];//开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
    CC_MD5( cStr, strlen(cStr), result);
    
    /*
     extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
     把cStr字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了result这个空间中
     
     */
    return [NSString stringWithFormat:
            
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            
            result[0], result[1], result[2], result[3],
            
            result[4], result[5], result[6], result[7],
            
            result[8], result[9], result[10], result[11],
            
            result[12], result[13], result[14], result[15]
            
            ];
    
    /*
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     NSLog("%02X", 0x888);  //888
     NSLog("%02X", 0x4); //04
     */
}

- (NSString *)jmc_transformToPinyin {
    /*复制出一个可变的对象*/
    NSMutableString *preString = [self mutableCopy];
    /*转换成成带音 调的拼音*/
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformMandarinLatin, NO);
    /*去掉音调*/
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformStripDiacritics, NO);
    
    /*多音字处理*/
    if ([[(NSString *)self substringToIndex:1] compare:@"长"] == NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 5) withString:@"chang"];
    }
    
    if ([[(NSString *)self substringToIndex:1] compare:@"沈"] == NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 4) withString:@"shen"];
    }
    
    if ([[(NSString *)self substringToIndex:1] compare:@"厦"] == NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 3) withString:@"xia"];
    }
    if ([[(NSString *)self substringToIndex:1] compare:@"地"] == NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 3) withString:@"di"];
    }
    
    if ([[(NSString *)self substringToIndex:1] compare:@"重"] == NSOrderedSame) {
        [preString replaceCharactersInRange:NSMakeRange(0, 5) withString:@"chong"];
    }
    return preString;
}

- (CGSize)jmc_sizeWithFont:(UIFont *)font
                     maxWidth:(CGFloat)maxWidth {
    return [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName: font}
                              context:nil].size;
}

- (CGSize)jmc_sizeWithFont:(UIFont *)font
                    maxHeight:(CGFloat)maxHeight {
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHeight)
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName: font}
                              context:nil].size;
}

// NSString以某种类型转换成date
- (NSDate *)jmc_dateWithformate:(NSString *)fromate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:fromate];
    NSDate *destDate = [dateFormatter dateFromString:self];
    return destDate;
}

//NSString转NSDate,格式yyyy-MM-dd HH:mm:ss
- (NSDate *)jmc_date{
    return [self jmc_dateWithformate:@"yyyy-MM-dd HH:mm:ss"];
}

@end
