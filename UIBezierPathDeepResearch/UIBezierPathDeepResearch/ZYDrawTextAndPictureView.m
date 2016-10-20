//
//  ZYDrawTextAndPictureView.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/20.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "ZYDrawTextAndPictureView.h"

@implementation ZYDrawTextAndPictureView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSString *str = @"Only override drawRect: if you perform custom drawing.";
    
    NSMutableDictionary *attributeDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    attributeDic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    attributeDic[NSForegroundColorAttributeName] = [UIColor yellowColor];
    attributeDic[NSStrokeWidthAttributeName] = @3;
    attributeDic[NSStrokeColorAttributeName] = [UIColor greenColor];
    [str drawInRect:rect withAttributes:attributeDic];
    
    
}


@end
