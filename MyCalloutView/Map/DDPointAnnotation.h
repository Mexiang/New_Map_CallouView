//
//  DDAnnotation.h
//  MyCalloutView
//
//  Created by Dry on 2017/10/20.
//  Copyright © 2017年 Dry. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>

@interface DDPointAnnotation : MAPointAnnotation

@property (nonatomic, copy) NSString *number;

@property (nonatomic, strong) UIImage *image;

//Code...这里可以扩展很多属性，来给大头针视图提供数据支持。

@end
