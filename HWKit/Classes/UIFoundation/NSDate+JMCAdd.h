//
//  NSDate+JMCAdd.h
//  Pods
//
//  Created by 洪伟 on 2017/3/30.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (JMCAdd)
/**获取当前时间的时间戳*/
+ (NSString *)jmc_getCurrentDateStamp;
/**
 * 计算指定时间与当前的时间差
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
- (NSString *)jmc_compareCurrentTime;

/*计算这个月有多少天*/
- (NSUInteger)jmc_numberOfDaysInCurrentMonth;
//获取这个月有多少周
- (NSUInteger)jmc_numberOfWeeksInCurrentMonth;
/*计算这个月的第一天是礼拜几*/
- (NSUInteger)jmc_weeklyOrdinality;
//计算这个月最开始的一天
- (NSDate *)jmc_firstDayOfCurrentMonth;

- (NSDate *)jmc_lastDayOfCurrentMonth;
//上一个月
- (NSDate *)jmc_dayInThePreviousMonth;
//下一个月
- (NSDate *)jmc_dayInTheFollowingMonth;
//获取当前日期之后的几个月
- (NSDate *)jmc_dayInTheFollowingMonth:(NSInteger)month;
//获取当前日期之后的几个天
- (NSDate *)jmc_dayInTheFollowingDay:(NSInteger)day;
//获取年月日对象
- (NSDateComponents *)jmc_ymcComponents;

- (NSString *)jmc_stringWithFormate:(NSString *)formate;

/**两个日期之间相差多少天*/
+ (NSInteger)jmc_getDayNumberFrom:(NSDate *)fromDay to:(NSDate *)toDate;

/**周日是“1”，周一是“2”,以此类推*/
- (NSInteger)jmc_getWeekIntValueWithDate;
//判断日期是今天,明天,后天,周几
- (NSString *)jmc_compareIfTodayWithDate;
/** 通过传入日期字符串，转换成具体星期几*/
+ (NSString *)jmc_getWeekStringWithDateStr:(NSString *)dateStr formate:(NSString *)formate;
@end
