HYPLocalNotificationManager
===========================

Handle local notifications like a pro.

# How to

Adding a notification has never been easier.

```objc
- (void)addLocalNotification
{
    NSInteger seconds = arc4random_uniform(10) + 10;
    NSString *soundName = @"alarm.caf";
    NSString *message = [NSString stringWithFormat:@"%ld seconds", (long)seconds];
    NSString *actionTitle = @"The best alarm ever just finished!";

    [HYPLocalNotificationManager createNotificationUsingNumberOfSeconds:seconds
                                                              soundName:soundName
                                                                message:message
                                                            actionTitle:actionTitle
                                                                alarmID:message];
}
```
Contributions
=============

If there's something you would like to improve please create a friendly and constructive issue, getting your feedback would be awesome. Have a great day.
