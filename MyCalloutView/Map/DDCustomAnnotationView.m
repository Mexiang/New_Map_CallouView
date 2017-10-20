//
//  DDCustomAnnotationView.m
//  DingDing
//
//  Created by Dry on 2017/6/13.
//  Copyright © 2017年 ddtech. All rights reserved.
//

#import "DDCustomAnnotationView.h"

#define kCalloutWidth       120.0
#define kCalloutHeight      45.0

@implementation DDCustomAnnotationView

//复写父类init方法
- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier])
    {
        //创建大头针视图
        [self setUpClloutView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
        return;
    }
    if (selected)
    {
        [self setUpClloutView];
    }
    else
    {
    }
    [super setSelected:selected animated:animated];
}

- (void)setUpClloutView {
    if (self.calloutView == nil)
    {
        self.calloutView = [[DDCustomCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
        [self addSubview:self.calloutView];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    /*坐标不合适再此设置即可*/
    //Code ...
    self.calloutView.frame = CGRectMake(-(kCalloutWidth-self.frame.size.width)*0.5, -kCalloutHeight, kCalloutWidth, kCalloutHeight);
}

@end
