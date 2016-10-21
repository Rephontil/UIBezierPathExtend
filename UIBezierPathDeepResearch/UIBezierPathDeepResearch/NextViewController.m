//
//  NextViewController.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/21.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "NextViewController.h"
#import "ZYCustomImageView.h"

@interface NextViewController ()

@property (weak, nonatomic) IBOutlet ZYCustomImageView *imageView_ZY;


@end

@implementation NextViewController

- (void)viewDidLoad {
    NSLog(@"%s",__func__);
    [super viewDidLoad];
    _imageView_ZY.image = [UIImage imageNamed:@"icon_lock_insect"];
    [self.view addSubview:_imageView_ZY];
    
    ZYCustomImageView *imageView = [[ZYCustomImageView alloc] initWithImage:[UIImage imageNamed:@"mile_20_icon"]];
    [self.view addSubview:imageView];


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
    _imageView_ZY.image = [UIImage imageNamed:@"icon_autoUnlock_attention_tip"];
}


@end
