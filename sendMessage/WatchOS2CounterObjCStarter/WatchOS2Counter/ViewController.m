//
//  ViewController.m
//  WatchOS2Counter
//
//  Created by Thai, Kristina on 6/20/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) NSMutableArray *counterData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

@end
