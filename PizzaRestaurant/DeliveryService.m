//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-30.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"

@implementation DeliveryService

- (instancetype) init{
    self = [super init];
    if (self) {
        self.allPizza = [NSMutableArray new];
    }
    return self;
}

- (void) deliverPizza:(Pizza *)pizza{
    [self.allPizza addObject:pizza];
    [self.delegate deliverPizza:pizza];
}

- (NSMutableArray *) history{
    NSMutableArray *details = [NSMutableArray new];
    for (Pizza *pizza in self.allPizza) {
        [details addObject:[pizza detailPizza:pizza]];
    }
    
    return details;
}



@end
