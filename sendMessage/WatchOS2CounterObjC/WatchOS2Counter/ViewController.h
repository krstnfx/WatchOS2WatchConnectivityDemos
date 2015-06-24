//
//  ViewController.h
//  WatchOS2Counter
//
//  Created by Thai, Kristina on 6/20/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) NSMutableArray *counterData;

@end

