//
//  InterfaceController.m
//  WatchOS2Counter WatchKit Extension
//
//  Created by Thai, Kristina on 6/20/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface InterfaceController() <WCSessionDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *counterLabel;
@property (nonatomic, assign) int counter;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];
    NSLog(@"%@ will activate", self);
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    
    self.counter = 0;
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (IBAction)incrementCounter {
    self.counter++;
    [self setCounterLabelText];
}

- (IBAction)clearCounter {
    self.counter = 0;
    [self setCounterLabelText];
}

- (IBAction)saveCounter {
    NSString *counterString = [NSString stringWithFormat:@"%d", self.counter];
    NSDictionary *applicationData = [[NSDictionary alloc] initWithObjects:@[counterString] forKeys:@[@"counterValue"]];
    
    [[WCSession defaultSession] sendMessage:applicationData
                               replyHandler:^(NSDictionary *reply) {
                                   //handle reply from iPhone app here
                               }
                               errorHandler:^(NSError *error) {
                                   //catch any errors here
                               }
     ];
}

- (void)setCounterLabelText {
    [self.counterLabel setText:[NSString stringWithFormat:@"%d", self.counter]];
}

@end



