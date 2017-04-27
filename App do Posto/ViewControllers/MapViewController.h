//
//  MapViewController.h
//  App do Posto
//
//  Created by IONews on 05/01/15.
//  Copyright (c) 2015 Ortale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "LocationHandler.h"
#import "Location.h"

@interface MapViewController : UIViewController<MKMapViewDelegate, LocationHandlerDelegate> {
    
    IBOutlet MKMapView *mapView;
    
    double latitude;
    double longitude;
    
}

@end
