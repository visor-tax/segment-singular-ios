//
//  SingularIntegation.m
//  Segment-Singular-iOS
//
//  Created by Eyal Rabinovich on 29/05/2019.
//  Copyright © 2019 Singular Labs. All rights reserved.
//

#import "SingularIntegation.h"
#import <Analytics/SEGAnalyticsConfiguration.h>
#import <Analytics/SEGAnalytics.h>
#import "Singular.h"

#define SEGMENT_REVENUE_KEY @"revenue"
#define SEGMENT_CURRENCY_KEY @"currency"
#define DEFAULT_CURRENCY @"USD"

@implementation SingularIntegation

- (instancetype)initWithSettings:(NSDictionary *)settings {
    self = [super init];
    if (!self) {
        return self;
    }
    
    NSString* apiKey = [settings objectForKey:@"apikey"];
    NSString* secret = [settings objectForKey:@"secret"];
    
    if (!apiKey || !secret){
        return nil;
    }
    
    [Singular startSession:apiKey withKey:secret];
    
    return self;
}

-(void)track:(SEGTrackPayload *)payload{
    
    if([[payload properties] objectForKey:SEGMENT_REVENUE_KEY] ||
       [[[payload properties] objectForKey:SEGMENT_REVENUE_KEY] doubleValue] != 0) {
        double revenue = [[[payload properties] objectForKey:SEGMENT_REVENUE_KEY] doubleValue];
        NSString* currency = DEFAULT_CURRENCY;
        
        if([[payload properties] objectForKey:SEGMENT_CURRENCY_KEY] &&
           [[[payload properties] objectForKey:SEGMENT_CURRENCY_KEY] length] > 0){
            currency = [[payload properties] objectForKey:SEGMENT_CURRENCY_KEY];
        }
    
        [Singular customRevenue:[payload event] currency:currency amount:revenue];
    } else {
        [Singular event:[payload event]];
    }
}

-(void)identify:(SEGIdentifyPayload *)payload{
    if([payload userId] && [[payload userId] length] > 0){
        [Singular setCustomUserId:[payload userId]];
    }
}

- (void)reset{
    [Singular unsetCustomUserId];
}

@end
