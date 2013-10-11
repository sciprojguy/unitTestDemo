//
//  unitTestDemoTests.m
//  unitTestDemoTests
//
//  Created by Chris Woodard on 10/10/13.
//  Copyright (c) 2013 none. All rights reserved.
//

#import "unitTestDemoTests.h"
#import "FormatsAndConversions.h"

@implementation unitTestDemoTests

-(void)setUp
{
    [super setUp];
}

-(void)tearDown
{
    [super tearDown];
}

//-(void)testExample
//{
//    STFail(@"Unit tests are not implemented yet in unitTestDemoTests");
//}

-(void)testCreateFormatter
{
    FormatsAndConversions *formatter = [FormatsAndConversions sharedFormatterAndConverter];
    STAssertNotNil(formatter, @"unable to create formatter");
}

-(void)test0KPHtoMPHConversion
{
    FormatsAndConversions *formatter = [FormatsAndConversions sharedFormatterAndConverter];
    STAssertNotNil(formatter, @"unable to create formatter");
    
    float mph = [formatter kilometersPerHourToMilesPerHour:0];
    STAssertTrue(mph == 0.0, @"0 kph should equal 0 mph");
}

-(void)test10KPHtoMPHConversion
{
    FormatsAndConversions *formatter = [FormatsAndConversions sharedFormatterAndConverter];
    STAssertNotNil(formatter, @"unable to create formatter");
    
    float mph = [formatter kilometersPerHourToMilesPerHour:10.0];
    STAssertEqualsWithAccuracy( mph, (float)6.21371, .001f, @"10 kph should equal 6.21371 mph");
}

-(void)test15KPHtoMPHConversion
{
    FormatsAndConversions *formatter = [FormatsAndConversions sharedFormatterAndConverter];
    STAssertNotNil(formatter, @"unable to create formatter");
    
    float mph = [formatter kilometersPerHourToMilesPerHour:15.0];
    STAssertEqualsWithAccuracy( mph, (float)9.32057, .001f, @"15 kph should equal 6.21371 mph");
}

-(void)testMphShortFormatting
{
    FormatsAndConversions *formatter = [FormatsAndConversions sharedFormatterAndConverter];
    STAssertNotNil(formatter, @"unable to create formatter");
    
    NSString *mphShort = [formatter milesPerHour:15.5];
    STAssertTrue([mphShort isEqualToString:@"15.5 mph"], @"mph short formatting not working: %@", mphShort);
}

#if 0

-(void)testKphShortFormatting
{
    FormatsAndConversions *formatter = [FormatsAndConversions sharedFormatterAndConverter];
    STAssertNotNil(formatter, @"unable to create formatter");
}

-(void)testMphLongFormatting
{
    FormatsAndConversions *formatter = [FormatsAndConversions sharedFormatterAndConverter];
    STAssertNotNil(formatter, @"unable to create formatter");
}

-(void)testKphLongFormatting
{
    FormatsAndConversions *formatter = [FormatsAndConversions sharedFormatterAndConverter];
    STAssertNotNil(formatter, @"unable to create formatter");
}

#endif

@end
