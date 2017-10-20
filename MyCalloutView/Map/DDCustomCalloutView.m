//
//  DDCustomCalloutView.m
//  DingDing
//
//  Created by Dry on 2017/6/13.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import "DDCustomCalloutView.h"

#define kArrorHeight 10


@implementation DDCustomCalloutView

- (void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height-kArrorHeight;
    //圆角半径
    CGFloat radius = (self.frame.size.height-kArrorHeight)*0.5;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 移动到初始点
    CGContextMoveToPoint(context, radius, 0);
    // 绘制第1条线和第1个1/4圆弧
    CGContextAddLineToPoint(context, width - radius, 0);
    CGContextAddArc(context, width - radius, radius, radius, -0.5 * M_PI, 0.0, 0);
    // 绘制第2条线和第2个1/4圆弧
    CGContextAddLineToPoint(context, width, height - radius);
    CGContextAddArc(context, width - radius, height - radius, radius, 0.0, 0.5 * M_PI, 0);
    // 绘制第3条线和第3个1/4圆弧
    CGContextAddLineToPoint(context, radius, height);
    CGContextAddArc(context, radius, height - radius, radius, 0.5 * M_PI, M_PI, 0);
    // 绘制第4条线和第4个1/4圆弧
    CGContextAddLineToPoint(context, 0, radius);
    CGContextAddArc(context, radius, radius, radius, M_PI, 1.5 * M_PI, 0);
    // 闭合路径
    CGContextClosePath(context);
    // 填充半透明黑色
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self setUpUI];
    }
    return self;
}

#pragma mark UI
- (void)setUpUI {
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(28, 0, self.frame.size.width-56, self.frame.size.height-kArrorHeight)];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.font = [UIFont systemFontOfSize:15.0];
    self.textLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.textLabel];
    
    self.leftNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, 20, self.frame.size.height-kArrorHeight)];
    self.leftNumLabel.backgroundColor = [UIColor clearColor];
    self.leftNumLabel.textAlignment = NSTextAlignmentCenter;
    self.leftNumLabel.font = [UIFont systemFontOfSize:15.0];
    self.leftNumLabel.textColor = [UIColor redColor];
    [self addSubview:self.leftNumLabel];
}


@end
