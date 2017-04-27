//
//  Location.h
//  App do Posto
//
//  Created by IONews on 06/01/15.
//  Copyright (c) 2015 Ortale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *nome;
@property (readonly) NSNumber *lat;
@property (readonly) NSNumber *lon;
@property (readonly) NSNumber *gasolina;
@property (readonly) NSNumber *alcool;
@property (readonly) NSNumber *diesel;

@end
