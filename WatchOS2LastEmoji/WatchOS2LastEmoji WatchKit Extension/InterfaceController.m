//
//  InterfaceController.m
//  WatchOS2LastEmoji WatchKit Extension
//
//  Created by Thai, Kristina on 6/21/15.
//  Copyright © 2015 Kristina Thai. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface InterfaceController() <WCSessionDelegate>

@property (strong, nonatomic) WCSession *session;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    if ([WCSession isSupported]) {
        self.session = [WCSession defaultSession];
        self.session.delegate = self;
        [self.session activateSession];
    }
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)catPressed {
    [self sendEmoji:@"cat"];
}
- (IBAction)dogPressed {
    [self sendEmoji:@"dog"];
}
- (IBAction)pandaPressed {
    [self sendEmoji:@"panda"];
}
- (IBAction)bunnyPressed {
    [self sendEmoji:@"bunny"];
}
- (IBAction)cowPressed {
    [self sendEmoji:@"cow"];
}
- (IBAction)hamsterPressed {
    [self sendEmoji:@"hamster"];
}

-(void)sendEmoji:(NSString *)emoji {
    NSDictionary *applicationDict = @{@"emoji":emoji};
    [self.session updateApplicationContext:applicationDict error:nil];
}

@end



