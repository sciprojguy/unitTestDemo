//
//  IntegrationTestDemo.m
//  unitTestDemo
//
//  Created by Chris Woodard on 10/10/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "IntegrationTestDemo.h"

#import "CalculationsModel.h"
#import "FormatsAndConversions.h"

@interface IntegrationTestDemo ()
@property (nonatomic, strong) CalculationsModel *model;
@property (nonatomic, strong) FormatsAndConversions *formatter;
@end

@implementation IntegrationTestDemo

-(void)setUp
{
    [super setUp];
    
    self.model = [CalculationsModel sharedModel];
    self.formatter = [FormatsAndConversions sharedFormatterAndConverter];
}

-(void)tearDown
{
    [super tearDown];
}

-(void)testComputingAndFormattingOneTravelSegment
{
    [self.model clearSegments];
    [self.model addDistance:100.0 andTime:1.0];
    
    CGFloat vel = [self.model averageVelocityInKilometersPerHour];
    NSString *formattedVel = [self.formatter kmPerHour:(float)vel];
    STAssertTrue([formattedVel isEqualToString:@"360.0 kph"], @"velocity should be 360kph");
}

@end
