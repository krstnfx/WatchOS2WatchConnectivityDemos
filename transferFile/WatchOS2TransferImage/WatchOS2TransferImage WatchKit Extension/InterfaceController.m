//
//  InterfaceController.m
//  WatchOS2TransferImage WatchKit Extension
//
//  Created by Thai, Kristina on 12/18/15.
//  Copyright © 2015 Thai, Kristina. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface InterfaceController() <WCSessionDelegate>
@property (weak, nonatomic) WCSession *session;
@end


@implementation InterfaceController

-(instancetype)init {
    self = [super init];
    
    if (self) {
        if ([WCSession isSupported]) {
            self.session = [WCSession defaultSession];
            self.session.delegate = self;
            [self.session activateSession];
        }
    }
    
    return self;
}

- (IBAction)sendDogs {
    if ([self.session isReachable]) {
        NSURL *filePath = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dogs" ofType:@"png"]];
        [self.session transferFile:filePath metadata:nil];
    }
}

-(void)session:(WCSession *)session didFinishFileTransfer:(WCSessionFileTransfer *)fileTransfer error:(NSError *)error {
    NSLog(@"error: %@", error);
}

@end



