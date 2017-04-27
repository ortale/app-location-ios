//
//  MapAnnotation.m
//  App do Posto
//
//  Created by IONews on 05/01/15.
//  Copyright (c) 2015 Ortale. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation
-(id)initWithTitle:(NSString *)title andCoordinate:
(CLLocationCoordinate2D)coordinate2d{
    self.title = title;
    self.coordinate =coordinate2d;
    return self;
}
@end
