//
//  secondManager.m
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-27.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "SecondManager.h"

@implementation SecondManager

- (BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings{
    return YES;
}

- (BOOL) kitchenShouldUpgradeOrder:(Kitchen *)kitchen{
    return YES;
}

- (void) kitchenDidMakePizza:(Pizza *)pizza{
    NSLog(@"Pizza is one of the perfect foods in the world, yeah?");
    [self.delegate deliverPizza:pizza];
}

@end
