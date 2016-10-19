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
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // UIView *shapeView = [[DrawShape alloc] initWithFrame:[UIScreen mainScreen].bounds];
   // [self.view addSubview:shapeView];
  
   // ZYProgressView *progressView = [[ZYProgressView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  //  [self.view addSubview:progressView];
}

- (IBAction)slider:(UISlider *)sender {
    NSLog(@"%0.02f",sender.value);
    ZYProgressView *view = [[ZYProgressView alloc] init];
    view.progressValue = sender.value;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
