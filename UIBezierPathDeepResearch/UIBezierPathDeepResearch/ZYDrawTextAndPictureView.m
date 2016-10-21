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
    attributeDic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    attributeDic[NSForegroundColorAttributeName] = [UIColor yellowColor];
    attributeDic[NSStrokeWidthAttributeName] = @3;
    
    NSShadow *shade = [[NSShadow alloc] init];
    shade.shadowColor = [UIColor redColor];
    shade.shadowOffset = CGSizeMake(2, 10);
    attributeDic[NSShadowAttributeName] = shade;


    attributeDic[NSStrokeColorAttributeName] = [UIColor greenColor];
    //设置文字的富文本属性 withAttributes
    [str drawInRect:rect withAttributes:attributeDic];

    //裁剪,裁剪的步骤一定要放在渲染的步骤之前进行.
    UIRectClip(CGRectMake(40,40, 100, 50));
    
    UIImage *image = [UIImage imageNamed:@"mile_20_icon"];
//    [image drawInRect:rect];
    [image drawAsPatternInRect:rect];

    
}


@end






