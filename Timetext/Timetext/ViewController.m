//
//  ViewController.m
//  Timetext
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 LookTour. All rights reserved.
//

#import "ViewController.h"
#import "DateFormate.h"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];

    _text.delegate = self;
    
//    NSString *time = @"2016-09-01 06:10:39";
    NSString *time = _text.text;
//    NSString *timeString = [DateFormate currentYestDayDateFrom:time params:@"YYYY-MM-dd HH:mm:ss" newParams:@"M月d日 HH:mm"];
    NSString *timeString = [DateFormate currentDateFrom:time params:@"YYYY-MM-dd HH:mm:ss" newParams:@"M月d日 HH:mm"];
    NSLog(@"%@",timeString);

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    
    //    NSString *time = @"2016-09-01 06:10:39";
    NSString *time = _text.text;
    //    NSString *timeString = [DateFormate currentYestDayDateFrom:time params:@"YYYY-MM-dd HH:mm:ss" newParams:@"M月d日 HH:mm"];
    NSString *timeString = [DateFormate currentDateFrom:time params:@"YYYY-MM-dd HH:mm:ss" newParams:@"M月d日 HH:mm"];
    _textLabel.text = timeString;

    return YES;
}

@end
