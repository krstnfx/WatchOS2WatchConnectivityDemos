//
//  ViewController.m
//  WatchOS2TransferImage
//
//  Created by Thai, Kristina on 12/18/15.
//  Copyright © 2015 Thai, Kristina. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface ViewController () <WCSessionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) WCSession *session;
@end

@implementation ViewController

-(void)viewDidLoad {
    if ([WCSession isSupported]) {
        self.session = [WCSession defaultSession];
        self.session.delegate = self;
        [self.session activateSession];
    }
}

-(void)session:(WCSession *)session didReceiveFile:(WCSessionFile *)file {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.loadingLabel.hidden = YES;
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:file.fileURL];
        self.imageView.image = [[UIImage alloc] initWithData:imageData];
    });
}

@end
