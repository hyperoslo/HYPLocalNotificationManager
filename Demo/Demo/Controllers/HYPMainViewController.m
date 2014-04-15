//
//  HYPMainViewController.m
//  Demo
//
//  Created by Elvis Nunez on 4/15/14.
//  Copyright (c) 2014 Hyper. All rights reserved.
//

#import "HYPMainViewController.h"
#import "HYPLocalNotificationManager.h"

@interface HYPMainViewController ()
@property (nonatomic, strong) NSArray *objects;
@end

@implementation HYPMainViewController

static NSString * const ANDYCellIdentifier = @"ANDYCellIdentifier";

- (NSArray *)objects
{
    if (_objects) {
        return _objects;
    }

    _objects = [HYPLocalNotificationManager localNotifications];
    return _objects;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ANDYCellIdentifier];

    UIBarButtonItem *addLocalNotificationButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addLocalNotification)];
    self.navigationItem.rightBarButtonItem = addLocalNotificationButton;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ANDYCellIdentifier forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [self.objects objectAtIndex:indexPath.row];
}

#pragma mark - Actions

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

    self.objects = nil;
    [self.tableView reloadData];
}

@end