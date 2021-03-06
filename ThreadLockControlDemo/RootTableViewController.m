//
//  RootTableViewController.m
//  ThreadLock
//
//  Created by Yasin on 16/2/23.
//  Copyright © 2016年 Yasin. All rights reserved.
//

#import "RootTableViewController.h"
#import "TestViewController.h"
@interface RootTableViewController ()
{
    NSArray *dateArray;
}
@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dateArray = @[@"atomic",@"NSLock",@"synchronized",@"DispatchSemaphore",@"NSCondition",@"NSConditionLock",@"NSRecursiveLock",@"POSIX",@"OSSpinLock",@"dispatch_barrier_async",@"dispatch_barrier_sync",@"整体测试"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"ThreadLock";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dateArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rootCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rootCell"];
    }
    cell.textLabel.text = dateArray[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id class = NSClassFromString([NSString stringWithFormat:@"%@Control",dateArray[indexPath.row]]);
    if ([class class]) {
        BaseViewController *view = [[BaseViewController alloc]initWithControl:[[class alloc] init]];
        view.title = dateArray[indexPath.row];
        [self.navigationController pushViewController:view animated:YES];
    }
    if (indexPath.row == dateArray.count-1) {
        TestViewController *view = [[TestViewController alloc]init];
        view.title = @"整体测试";
        [self.navigationController pushViewController:view animated:YES];
    }
}

@end
