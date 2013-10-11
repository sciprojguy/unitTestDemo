//
//  CalculationsModel.m
//  unitTestDemo
//
//  Created by Chris Woodard on 10/10/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "CalculationsModel.h"

@interface CalculationsModel ()

@property (nonatomic, strong) NSMutableArray *travelSegments;

@end

@implementation CalculationsModel

+(id)sharedModel
{
    static dispatch_once_t token = 0;
    static CalculationsModel *sharedCalc = nil;
    dispatch_once( &token, ^{
        sharedCalc = [[CalculationsModel alloc] init];
        sharedCalc.travelSegments = [[NSMutableArray alloc] initWithCapacity:0];
    });
    return sharedCalc;
}

-(void)addDistance:(CGFloat)distanceInMeters andTime:(CGFloat)elapsedSeconds
{
    NSDictionary *travelSegment = @{@"distance":@(distanceInMeters), @"time":@(elapsedSeconds)};
    [self.travelSegments addObject:travelSegment];
}

-(CGFloat)totalDistanceTraveled
{
    CGFloat totalDistance = 0.0;
    for( NSDictionary *travelSegment in self.travelSegments )
    {
        totalDistance += [travelSegment[@"distance"] doubleValue];
    }
    return totalDistance;
}

-(CGFloat)totalTimeTraveled
{
    CGFloat totalTime = 0.0;
    for( NSDictionary *travelSegment in self.travelSegments )
    {
        totalTime += [travelSegment[@"time"] doubleValue];
    }
    return totalTime;
}

-(CGFloat)averageVelocityInMetersPerSecond
{   CGFloat avgVelocity = NAN;
    CGFloat totalVelocity = 0.0;
    CGFloat numValidSegments = 0.0;
    for( NSDictionary *travelSegment in self.travelSegments )
    {
        CGFloat segmentTime = [travelSegment[@"time"] doubleValue];
        if(segmentTime>0)
        {
            CGFloat velocity = [travelSegment[@"distance"] doubleValue]/segmentTime;
            totalVelocity += velocity;
            numValidSegments += 1.0;
        }
    }
    
    if(numValidSegments>0.0)
        avgVelocity = totalVelocity / numValidSegments;
    
    return avgVelocity;
}

-(CGFloat)averageVelocityInKilometersPerHour
{   CGFloat avgVelocity = NAN;
    CGFloat totalVelocity = 0.0;
    CGFloat numValidSegments = 0.0;
    for( NSDictionary *travelSegment in self.travelSegments )
    {
        CGFloat segmentTime = [travelSegment[@"time"] doubleValue];
        if(segmentTime>0)
        {
            CGFloat velocity = [travelSegment[@"distance"] doubleValue]/segmentTime;
            totalVelocity += velocity;
            numValidSegments += 1.0;
        }
    }
    
    if(numValidSegments>0.0)
        avgVelocity = totalVelocity / numValidSegments;
    
    return 3600.0*avgVelocity/1000.0;
}

-(void)clearSegments
{
    [self.travelSegments removeAllObjects];
}

@end
