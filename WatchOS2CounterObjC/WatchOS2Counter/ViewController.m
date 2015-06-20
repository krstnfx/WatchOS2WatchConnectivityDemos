//
//  ViewController.m
//  WatchOS2Counter
//
//  Created by Thai, Kristina on 6/20/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface ViewController () <WCSessionDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    
    if (!self.counterData) {
        self.counterData = [[NSMutableArray alloc] init];
    }
    
    [self.mainTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.counterData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CounterCell";
    UITableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSString *counterValueString = [self.counterData objectAtIndex:indexPath.row];
    cell.textLabel.text = counterValueString;
    
    return cell;
}

- (void)session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *,id> *)message replyHandler:(nonnull void (^)(NSDictionary<NSString *,id> * __nonnull))replyHandler {
    NSString *counterValue = [message objectForKey:@"counterValue"];
    
    if (!self.counterData) {
        self.counterData = [[NSMutableArray alloc] init];
    }
    
    //Use this to update the UI instantaneously (otherwise, takes a little while)
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.counterData addObject:counterValue];
        [self.mainTableView reloadData];
    });
    


}


@end
