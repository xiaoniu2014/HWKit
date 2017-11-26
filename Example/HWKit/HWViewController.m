//
//  HWViewController.m
//  HWKit
//
//  Created by hongw on 11/26/2017.
//  Copyright (c) 2017 hongw. All rights reserved.
//

#import "HWViewController.h"
#import "HWKit.h"

@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *s = [NSDate jmc_getCurrentDateStamp];
    JMCLog(@"==%@",s);
}

@end
