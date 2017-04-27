//
//  MapViewController.m
//  App do Posto
//
//  Created by IONews on 05/01/15.
//  Copyright (c) 2015 Ortale. All rights reserved.
//

#import "MapViewController.h"
#import "MapAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    mapView.delegate = self;
    mapView.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude);
    mapView.mapType = MKMapTypeStandard;
    
    [[LocationHandler getSharedInstance]setDelegate:self];
    [[LocationHandler getSharedInstance]startUpdating];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.108:8081"];
    [self locationsFromJSONFile:url];
}

// When a map annotation point is added, zoom to it (1500 range)
/*
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance
    ([mp coordinate], 1500, 1500);
    [mv setRegion:region animated:YES];
    [mv selectAnnotation:mp animated:YES];
}
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    latitude = newLocation.coordinate.latitude;
    longitude = newLocation.coordinate.longitude;
    //[latitudeLabel setText:[NSString stringWithFormat: @"Latitude: %f",newLocation.coordinate.latitude]];
    //[longitudeLabel setText:[NSString stringWithFormat: @"Longitude: %f",newLocation.coordinate.longitude]];
    
}

- (NSArray *)locationsFromJSONFile:(NSURL *)url {
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
    
    // Get the data
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // Create a new array to hold the locations
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    
    // Get an array of dictionaries with the key "locations"
    NSArray *array = [jsonDictionary objectForKey:@"postos"];
    // Iterate through the array of dictionaries
    for(NSDictionary *dict in array) {
        CLLocationCoordinate2D locationCoordinate2D;
        double lat = [[dict objectForKey:@"lat"] doubleValue];
        double lon = [[dict objectForKey:@"lon"] doubleValue];
        
        NSString *nome = [dict objectForKey:@"nome"];
        NSNumber *gasolina = [dict objectForKey:@"gasolina"];
        NSNumber *alcool = [dict objectForKey:@"alcool"];
        NSNumber *diesel = [dict objectForKey:@"diesel"];
        
        NSString * titulo = [[NSString alloc] initWithString:nome];
        titulo = [titulo stringByAppendingString:@"gasolina: "];
        titulo = [titulo stringByAppendingString:[gasolina stringValue]];
        titulo = [titulo stringByAppendingString:@"alcool: "];
        titulo = [titulo stringByAppendingString:[alcool stringValue]];
        titulo = [titulo stringByAppendingString:@"diesel: "];
        titulo = [titulo stringByAppendingString:[diesel stringValue]];
        
        locationCoordinate2D.latitude = lat;
        locationCoordinate2D.longitude = lon;
        // Add the annotation to our map view
        MapAnnotation *newAnnotation = [[MapAnnotation alloc] initWithTitle:titulo andCoordinate:locationCoordinate2D];
        [mapView addAnnotation:newAnnotation];
    }
    
    // Return the array of Location objects
    return locations;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
