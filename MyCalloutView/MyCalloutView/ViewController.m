//
//  ViewController.m
//  MyCalloutView
//
//  Created by Dry on 2017/10/20.
//  Copyright © 2017年 Dry. All rights reserved.
//

#import "ViewController.h"
#import "Map.h"
#import "DDPointAnnotation.h"

@interface ViewController ()

@property (nonatomic, strong) Map *map;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加地图
    [self.view addSubview:self.map];
    //地图上添加大头针
    DDPointAnnotation *start = [[DDPointAnnotation alloc] init];
    start.title = @"国贸";
    start.number = @"1";
    start.image = [UIImage imageNamed:@"start"];
    start.coordinate = CLLocationCoordinate2DMake(39.90841537, 116.45969689);
    [self.map.mapView addAnnotation:start];
    
    DDPointAnnotation *end = [[DDPointAnnotation alloc] init];
    end.title = @"故宫";
    end.number = @"2";
    end.image = [UIImage imageNamed:@"end"];
    end.coordinate = CLLocationCoordinate2DMake(39.92000603, 116.39465332);
    [self.map.mapView addAnnotation:end];
    //设置地图范围
    [self.map.mapView showAnnotations:@[start,end] animated:NO];
}

- (Map *)map {
    if (!_map) {
        _map = [[Map alloc] initWithFrame:self.view.bounds];
    }
    return _map;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
