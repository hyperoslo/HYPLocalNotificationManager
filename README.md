HYPLocalNotificationManager
===========================

Handle local notifications like a pro.

# How to

```objc
- (void)addLocalNotification
{
    NSInteger seconds = arc4random_uniform(10) + 10;
    NSString *soundName = @"alarm.caf";
    NSString *message = [NSString stringWithFormat:@"%ld seconds", (long)seconds];
    NSString *actionTitle = @"The best alarm ever just finished!";

    [HYPLocalNotificationManager createNotificationUsingNumberOfSeconds:seconds soundName:soundName message:message actionTitle:actionTitle alarmID:message];
}
```
