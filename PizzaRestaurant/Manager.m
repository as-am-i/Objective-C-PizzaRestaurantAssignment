//
//  Manager.m
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-27.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Manager.h"

@implementation Manager

- (BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings{
    BOOL shouldMakePizza = YES;
    for (NSString *topping in toppings) {
        if ([topping isEqualToString:@"anchovies"]) {
            shouldMakePizza = NO;
        }
    }
    return shouldMakePizza;
}

- (BOOL) kitchenShouldUpgradeOrder:(Kitchen *)kitchen{
    return NO;
}

- (void) kitchenDidMakePizza:(Pizza *)pizza{
    [self.delegate deliverPizza:pizza];
}

@end
