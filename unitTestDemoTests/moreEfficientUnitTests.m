//
//  moreEfficientUnitTests.m
//  unitTestDemo
//
//  Created by Chris Woodard on 10/10/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "MoreEfficientUnitTests.h"
#import "FormatsAndConversions.h"

@interface MoreEfficientUnitTests ()
@property (nonatomic, strong) FormatsAndConversions *formatter;
@end

@implementation MoreEfficientUnitTests

-(void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.formatter = [FormatsAndConversions sharedFormatterAndConverter];
}

-(void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)test0KPHtoMPHConversion
{
    float mph = [self.formatter kilometersPerHourToMilesPerHour:0];
    STAssertTrue(mph == 0.0, @"0 kph should equal 0 mph");
}

-(void)test10KPHtoMPHConversion
{
    float mph = [self.formatter kilometersPerHourToMilesPerHour:10.0];
    STAssertEqualsWithAccuracy( mph, (float)6.21371, .001f, @"10 kph should equal 6.21371 mph");
}

-(void)test15KPHtoMPHConversion
{
    float mph = [self.formatter kilometersPerHourToMilesPerHour:15.0];
    STAssertEqualsWithAccuracy( mph, (float)9.32057, .001f, @"15 kph should equal 6.21371 mph");
}

-(void)testMphShortFormatting
{
    NSString *mphShort = [self.formatter milesPerHour:15.5];
    STAssertTrue([mphShort isEqualToString:@"15.5 mph"], @"mph short formatting not working");
}

@end
