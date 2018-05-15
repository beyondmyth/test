//
//  ViewController.m
//  test
//
//  Created by myth on 2018/5/14.
//  Copyright © 2018年 myth. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        // 使用 UNUserNotificationCenter 来管理通知
        UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    
    //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"第一次30天" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"第二次推送7天之后"     arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    
    // 在 设定时间 后推送本地推送
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
    triggerWithTimeInterval:5 repeats:NO];
    
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content trigger:trigger];
    
    //添加推送成功后的处理！
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"推送成功,10秒之后再推送一次");
        [self sevenDay];
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)sevenDay{
    // 使用 UNUserNotificationCenter 来管理通知
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    
    //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"现在是七天之后" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"七天"     arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    
    // 在 设定时间 后推送本地推送
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                                                  triggerWithTimeInterval:20 repeats:NO];
    
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"Second"
                                                                          content:content trigger:trigger];
    
    //添加推送成功后的处理！
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"推送七天");
    }];
    
    
    
    NSLog(@"不知道些什么");
    NSLog(@"不知道些什么");
    NSLog(@"不知道些什么");
    NSLog(@"不知道些什么");
    
    NSLog(@"健权去嫖");
    NSLog(@"健权去嫖");
    NSLog(@"健权去嫖");
    NSLog(@"健权去嫖");
    NSLog(@"健权去嫖");
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
