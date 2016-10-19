//
//  ViewController.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/19.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "ViewController.h"
#include "DrawShape.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *shapeView = [[DrawShape alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:shapeView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
