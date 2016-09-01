//
//  DateFormate.h
//  WeiBo
//
//  Created by mac on 15/9/19.
//  Copyright (c) 2015年 mxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormate : NSObject


/**
 *  方法说明：string 格式化为 date
 *
 *  @param datestring:被转换的时间字符
 *         formate:被转换的的时间字符的时间格式
 *
 *  @return
 */
+ (NSDate *)getDateFrom:(NSString *)dateString params:(NSString *)params;

/**
 *  方法说明：date 格式化为 string
 *
 *  @param date:被转换的时间参数
 *         formate:需要的时间字符串格式
 *
 *  @return
 */
+ (NSString *)getDateStringFrom:(NSDate *)date params:(NSString *)params;

/**
 *  方法说明：时间字符 ——> 时间字符
 *
 *  @param datestring:需要转换的时间字符
 *         oldParams:被转换的时间字符的时间格式
 *         newParams:需要转换出得时间字符的时间格式
 *
 *  @return
 */
+ (NSString *)getDateStringFrom:(NSString *)dateString
                      oldParams:(NSString *)oldParams
                      newParams:(NSString *)newParams;

/**
 *  方法说明：返回发送时间(传入当前时间，24小时之内的数据显示几个小时之前几分钟之前，24小时之外的数据显示几月几号，在)
 *
 *  @param datestring:待转换的时间字符
 *         oldFormatter:被转换的时间字符的时间格式
 *         newFormatter:需要转换出得时间字符的时间格式
 *
 *  @return
 */
+ (NSString *)currentDateFrom:(NSString *)dateString
                       params:(NSString *)params
                    newParams:(NSString *)newParams;
/**
 *  方法说明：返回发送时间(传入当前时间，过了00：00点之前为昨天，昨天之前可以显示几月几号，一天之内（00：00之后）显示几小时之前，几分钟之前)
 *
 *  @param datestring:待转换的时间字符
 *         oldFormatter:被转换的时间字符的时间格式
 *         newFormatter:需要转换出得时间字符的时间格式
 *
 *  @return
 */
+ (NSString *)currentYestDayDateFrom:(NSString *)dateString
                       params:(NSString *)params
                    newParams:(NSString *)newParams;

@end
