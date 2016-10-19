//
//  ViewController.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/19.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "ViewController.h"
#include "DrawShape.h"
#import "ZYProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *sliderProgress;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet ZYProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)sliderProgress:(UISlider *)sender {
    NSLog(@"%0.2f",sender.value);
    _progressView.progressValue = sender.value;
    self.label.text = [NSString stringWithFormat:@"%.2f%@",sender.value * 100,@"%"];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
