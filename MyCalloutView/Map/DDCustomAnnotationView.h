//
//  DDCustomAnnotationView.h
//  DingDing
//
//  Created by Dry on 2017/6/13.
//  Copyright © 2017年 ddtech. All rights reserved.

//  大头针视图


#import <MAMapKit/MAMapKit.h>
#import "DDCustomCalloutView.h"

@interface DDCustomAnnotationView : MAAnnotationView

@property (nonatomic, strong) DDCustomCalloutView *calloutView;

@end
