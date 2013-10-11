//
//  FormatsAndConversions.m
//  unitTestDemo
//
//  Created by Chris Woodard on 10/10/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "FormatsAndConversions.h"

@implementation FormatsAndConversions

+(id)sharedFormatterAndConverter
{
    static dispatch_once_t token = 0;
    static FormatsAndConversions *sharedFormatter = nil;
    dispatch_once( &token, ^{
        sharedFormatter = [[FormatsAndConversions alloc] init];
    });
    return sharedFormatter;
}

-(float)kilometersPerHourToMilesPerHour:(float)kph
{
    return kph / 1.60934;
}

-(float)milesPerHourTokilometerssPerHour:(float)mph
{
    return mph * 1.60934;
}

-(NSString *)milesPerHour:(float)mph
{
    return [NSString stringWithFormat:@"%.1f mph", mph];
}

-(NSString *)milesPerHourLong:(float)mph
{
    return [NSString stringWithFormat:@"%.1f miles/hour", mph];
}

-(NSString *)kmPerHour:(float)kph
{
    return [NSString stringWithFormat:@"%.1f kph", kph];
}

-(NSString *)kmPerHourLong:(float)kph
{
    return [NSString stringWithFormat:@"%.1f kilometers/hour", kph];
}

@end
