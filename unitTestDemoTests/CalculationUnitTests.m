//
//  CalculationUnitTests.m
//  unitTestDemo
//
//  Created by Chris Woodard on 10/10/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "CalculationUnitTests.h"
#import "CalculationsModel.h"

@interface CalculationUnitTests ()
@property (nonatomic, strong) CalculationsModel *model;
@end

@implementation CalculationUnitTests

-(void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.model = [CalculationsModel sharedModel];
    STAssertNotNil(self.model, @"unable to create singleton.  AAAAAGH!");
}

-(void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testOneTravelSegment
{
    [self.model clearSegments];
    [self.model addDistance:100.0 andTime:1.0];
    
    CGFloat vel = [self.model averageVelocityInMetersPerSecond];
    STAssertEqualsWithAccuracy((CGFloat)100.0, vel, 0.001, @"should be 100 meters per second");
}

-(void)testTwoTravelSegments
{
    [self.model clearSegments];
    [self.model addDistance:100.0 andTime:1.0];
    [self.model addDistance:0.0 andTime:1.0];
    
    CGFloat vel = [self.model averageVelocityInMetersPerSecond];
    STAssertEqualsWithAccuracy((CGFloat)50.0, vel, 0.001, @"should be 100 meters per second");
}

-(void)testThreeTravelSegments
{
    [self.model clearSegments];
    [self.model addDistance:100.0 andTime:1.0];
    [self.model addDistance:20.0 andTime:1.0];
    [self.model addDistance:0.0 andTime:1.0];
    
    CGFloat vel = [self.model averageVelocityInMetersPerSecond];
    STAssertEqualsWithAccuracy((CGFloat)40.0, vel, 0.001, @"should be 100 meters per second");
}

-(void)testZeroTravelSegments
{
    [self.model clearSegments];
    CGFloat vel = [self.model averageVelocityInMetersPerSecond];
    STAssertEqualsWithAccuracy((CGFloat)NAN, vel, 0.001, @"should be 100 meters per second");
}

@end
