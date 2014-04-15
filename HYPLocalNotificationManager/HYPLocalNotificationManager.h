//
//  HYPLocalNotificationManager.h
//
//  Created by Elvis Nunez on 02/12/13.
//  Copyright (c) 2013 Hyper. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const HYPNotificationIDKey = @"HYPNotificationID";
static NSString * const HYPNotificationFireDateKey = @"HYPNotificationFireDate";
static NSString * const HYPNotificationFireIntervalKey = @"HYPNotificationFireInterval";

@interface HYPLocalNotificationManager : NSObject
+ (void)createNotificationUsingNumberOfSeconds:(NSInteger)numberOfSeconds soundName:(NSString *)soundName message:(NSString *)message actionTitle:(NSString *)actionTitle alarmID:(NSString *)alarmID;
+ (UILocalNotification *)existingNotificationWithAlarmID:(NSString *)alarmID;
+ (void)cancelNotificationWithAlarmID:(NSString *)alarmID;
+ (NSArray *)localNotifications;
@end
