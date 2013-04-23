//
//  ViewController.m
//  animation
//
//  Created by Penny on 13-1-16.
//  Copyright (c) 2013年 Penny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
UIImageView *view = nil;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    [btn setFrame: CGRectMake(50, 50, 60, 60)];
    [btn addTarget: self action: @selector(click:) forControlEvents: UIControlEventTouchUpInside];
    [btn setBackgroundColor: [UIColor redColor]];
    
    UIButton *btn2 = [UIButton buttonWithType: UIButtonTypeCustom];
    [btn2 setFrame: CGRectMake(50, 400, 60, 60)];
    [btn2 addTarget: self action: @selector(click2:) forControlEvents: UIControlEventTouchUpInside];
    
    [btn2 setBackgroundColor: [UIColor yellowColor]];
    
    
    [self.view addSubview: btn2];
    [self.view addSubview: btn];
        
}

- (void)click:(id)sender
{
    if (view != nil) {
        [view removeFromSuperview];
        [view release];
    }

    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    view = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
    [bgView addSubview: view];
    
    [view setImage: [UIImage imageNamed: @"1.png"]];
    [self.view addSubview: bgView];
    [self.view bringSubviewToFront: bgView];
    
    [view popupAnimation: popAndFlip Duration: .6 completion:^(BOOL finished) {
        
    }];

}

- (void)click2:(id)sender
{
    [view dismissAnimation: popAndFlip Duration: .6 completion:^(BOOL finished) {
        [view.superview removeFromSuperview];
        [view.superview release];
        view = nil;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
