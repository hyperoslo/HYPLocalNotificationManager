//
//  HYPLocalNotificationManager.m
//
//  Created by Elvis Nunez on 02/12/13.
//  Copyright (c) 2013 Hyper. All rights reserved.
//

#import "HYPLocalNotificationManager.h"

@interface HYPLocalNotificationManager ()
@end

@implementation HYPLocalNotificationManager

+ (void)createNotificationUsingNumberOfSeconds:(NSInteger)numberOfSeconds soundName:(NSString *)soundName message:(NSString *)message actionTitle:(NSString *)actionTitle alarmID:(NSString *)alarmID
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.soundName = soundName;
    if (!notification)
        return;

    NSDate *fireDate = [[NSDate date] dateByAddingTimeInterval:numberOfSeconds];
    notification.fireDate = fireDate;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = message;
    notification.alertAction = actionTitle;
    if (actionTitle) {
        notification.hasAction = YES;
    }

    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:alarmID forKey:HYPNotificationIDKey];
    [userInfo setObject:[NSDate date] forKey:HYPNotificationFireDateKey];
    [userInfo setObject:@(numberOfSeconds) forKey:HYPNotificationFireIntervalKey];
    notification.userInfo = userInfo;

    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

+ (UILocalNotification *)existingNotificationWithAlarmID:(NSString *)alarmID
{
    for (UILocalNotification *notification in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        if ([[notification.userInfo objectForKey:HYPNotificationIDKey] isEqualToString:alarmID]) {
            return notification;
        }
    }

    return nil;
}

+ (void)cancelNotificationWithAlarmID:(NSString *)alarmID
{
    UILocalNotification *notification = [self existingNotificationWithAlarmID:alarmID];
    if (notification) {
        [[UIApplication sharedApplication] cancelLocalNotification:notification];
    }
}

+ (NSArray *)localNotifications
{
    NSMutableArray *notifications = [NSMutableArray array];
    for (UILocalNotification *notification in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        if ([notification.userInfo objectForKey:HYPNotificationIDKey]) {
            NSString *message = notification.alertBody;
            [notifications addObject:message];
        }
    }
    return [NSArray arrayWithArray:notifications];
}

@end
