# New_Map_CallouView
高德地图之自定义大头针气泡视图
```
/**
 * @brief 根据anntation生成对应的View。
 * @param mapView 地图View
 * @param annotation 指定的标注
 * @return 生成的标注View
 */
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation {
    /*这里根据不同类型的大头针，生成不同的大头针视图
     为了方便起见我们继承MAPointAnnotation创建了自己的DDAnnotation，用来扩展更多属性，给大头针视图提供更多数据等
     */
    if ([annotation isKindOfClass:[DDPointAnnotation class]])
    {
        static NSString *reusedID = @"DDPointAnnotation_reusedID";
        DDCustomAnnotationView *annotationView = (DDCustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reusedID];
        
        if (!annotationView) {
            annotationView = [[DDCustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reusedID];
            annotationView.canShowCallout = NO;//设置此属性为NO，防止点击的时候高德自带的气泡弹出
        }
        
        //给气泡赋值
        DDPointAnnotation *ddAnnotation = (DDPointAnnotation *)annotation;
        NSLog(@"********* %@ %@",ddAnnotation.title,ddAnnotation.number);
        annotationView.calloutView.textLabel.text = ddAnnotation.title;
        annotationView.calloutView.leftNumLabel.text = ddAnnotation.number;
        
        annotationView.image = ddAnnotation.image;//设置大头针图片
        annotationView.centerOffset = CGPointMake(0, -0.5*ddAnnotation.image.size.height);

        return annotationView;
    }
    
    return nil;
}
```
更多功能可自行扩展...


