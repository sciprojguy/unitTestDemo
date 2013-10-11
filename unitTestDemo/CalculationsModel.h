//
//  CalculationsModel.h
//  unitTestDemo
//
//  Created by Chris Woodard on 10/10/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationsModel : NSObject

+(id)sharedModel;

-(void)addDistance:(CGFloat)distanceInMeters andTime:(CGFloat)elapsedSeconds;
-(CGFloat)totalDistanceTraveled;
-(CGFloat)totalTimeTraveled;
-(CGFloat)averageVelocityInMetersPerSecond;
-(CGFloat)averageVelocityInKilometersPerHour;
-(void)clearSegments;

@end
