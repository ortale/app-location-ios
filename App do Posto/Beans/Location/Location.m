//
//  Location.m
//  App do Posto
//
//  Created by IONews on 06/01/15.
//  Copyright (c) 2015 Ortale. All rights reserved.
//

#import "Location.h"

@implementation Location

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _nome = [jsonDictionary objectForKey:@"nome"];
        _lat = [jsonDictionary objectForKey:@"lat"];
        _lon = [jsonDictionary objectForKey:@"lon"];
        _gasolina = [jsonDictionary objectForKey:@"gasolina"];
        _alcool = [jsonDictionary objectForKey:@"alcool"];
        _diesel = [jsonDictionary objectForKey:@"diesel"];
    }
    
    return self;
}

@end
