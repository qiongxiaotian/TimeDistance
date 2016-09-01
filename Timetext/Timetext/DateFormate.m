//
//  DateFormate.m
//  WeiBo
//
//  Created by mac on 15/9/19.
//  Copyright (c) 2015年 mxy. All rights reserved.
//

#import "DateFormate.h"

@implementation DateFormate

//String转化为Data
+ (NSDate *)getDateFrom:(NSString *)dateString params:(NSString *)params{

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    //重新定义转换格式
    [formatter setDateFormat:params];
    
    //格式转换,传入需要换的date转化为字符串

    NSDate *date = [formatter dateFromString:dateString];
    
    return date;
}

//将date转化为string 传入需要的NSdata拿到字符串
+ (NSString *)getDateStringFrom:(NSDate *)date params:(NSString *)params{

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];

    [formatter setDateFormat:params];
    
    NSString *string = [formatter stringFromDate:date];
    
    return string;
}

+ (NSString *)getDateStringFrom:(NSString *)dateString oldParams:(NSString *)oldParams newParams:(NSString *)newParams{

    //将传入的时间字符按对应的时间格式转换为NSDate
    NSDate *date = [DateFormate getDateFrom:dateString params:oldParams];
    //将转换的NSData转化为需要格式的时间字符
    NSString *newString = [DateFormate getDateStringFrom:date params:newParams];
    
    return newString;
}

+ (NSString *)currentYestDayDateFrom:(NSString *)dateString params:(NSString *)params newParams:(NSString *)newParams{

    //把时间字符串转换为NSDate
    NSDate *date = [DateFormate getDateFrom:dateString params:params];
    
    //返回当前时间与传入时间的相隔秒数，也可以这样理解：从传入时间开始，经过多少秒到达对象当前时间。
    //拿到之前的某一个时间到当前的时间间隔
    NSTimeInterval afferentDistance = [[NSDate new] timeIntervalSinceDate:date];

    NSDateFormatter *strFomate = [[NSDateFormatter alloc]init];
    //设置时间戳格式
    [strFomate setDateFormat:@"YYYY-MM-dd"];
    //获取当前的时间（我们为东8区，加上28800 为东8区时间）
    NSDate *dateNow = [NSDate dateWithTimeIntervalSinceNow:28800];
    
    //获得现在的时间字符串
    NSString *nowstr = [strFomate stringFromDate:dateNow];
    //截取字符串（2016-09-01 形式）
    NSString *stringOne = [nowstr substringToIndex:10];
    //拼接字符串 (拼接为今天的0点   2016-09-01 00：00)
    NSString *pinjietime = [NSString stringWithFormat:@"%@ 00:00:00",stringOne];
    
    //把时间字符串转换为NSDate
    NSDate *date1 = [DateFormate getDateFrom:pinjietime params:@"YYYY-MM-dd HH:mm:ss"];
    //拿到当前时间到当前今天零点的时间间隔
    NSTimeInterval distanceOrze = [[NSDate new] timeIntervalSinceDate:date1];
    //比较2个时间间隔
    if (distanceOrze < afferentDistance && afferentDistance < (distanceOrze+24*60*60)) {//昨天
        return @"昨天";
    }else if (afferentDistance < distanceOrze) {
        
        if (afferentDistance<60*60) {//一小时内
            
            if (afferentDistance<60) {//一分钟内
                
                return @"刚刚";
            }
            return [NSString stringWithFormat:@"%ld分钟之前",(long)afferentDistance/60];
        }
        return [NSString stringWithFormat:@"%ld小时之前",(long)afferentDistance/60/60];
    }
    
    
    //超过一天，按需要的转换格式转换时间，输出字符串
    return [DateFormate getDateStringFrom:date params:newParams];
}
+ (NSString *)currentDateFrom:(NSString *)dateString
                       params:(NSString *)params
                    newParams:(NSString *)newParams{
    //把时间字符串转换为NSDate
    NSDate *date = [DateFormate getDateFrom:dateString params:params];
    
    //返回当前时间与传入时间的相隔秒数，也可以这样理解：从传入时间开始，经过多少秒到达对象当前时间。
    //拿到之前的某一个时间到当前的时间间隔
    
    NSTimeInterval distance = [[NSDate new] timeIntervalSinceDate:date];
    

    if (distance<24*60*60) {//一天内

        if (distance<60*60) {//一小时内

            if (distance<60) {//一分钟内

                return @"刚刚";
            }
            return [NSString stringWithFormat:@"%ld分钟之前",(long)distance/60];
        }
        return [NSString stringWithFormat:@"%ld小时之前",(long)distance/60/60];
    }
    //超过一天，按需要的转换格式转换时间，输出字符串
    return [DateFormate getDateStringFrom:date params:newParams];
}

@end
