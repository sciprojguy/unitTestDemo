//
//  FormatsAndConversions.h
//  unitTestDemo
//
//  Created by Chris Woodard on 10/10/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormatsAndConversions : NSObject

+(id)sharedFormatterAndConverter;

-(float)kilometersPerHourToMilesPerHour:(float)kph;
-(float)milesPerHourTokilometerssPerHour:(float)mph;

-(NSString *)milesPerHour:(float)mph;
-(NSString *)milesPerHourLong:(float)mph;

-(NSString *)kmPerHour:(float)kph;
-(NSString *)kmPerHourLong:(float)kph;

@end
