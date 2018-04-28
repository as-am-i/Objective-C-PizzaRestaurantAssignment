//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings{
    Pizza *newPizza;
    if ([self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings] == YES) {
        if ([self.delegate kitchenShouldUpgradeOrder:self] == YES) {
            newPizza = [[Pizza alloc] initWithSize:large andToppings:toppings];
        } else {
            newPizza = [[Pizza alloc] initWithSize:size andToppings:toppings];
        }
        
        if ([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
            [self.delegate kitchenDidMakePizza:newPizza];
        }
    }
    return newPizza;
}

- (Pizza *) makelargePepperoni{
    return [Pizza largePepperoni];
}

- (Pizza *) makeHawaiianWithSize:(PizzaSize)size{
    return [Pizza hawaiianWithSize:size];
}

- (PizzaSize) getSizeOfPizza:(NSString *)input{
    PizzaSize size;
    if ([input isEqualToString:@"small"]) {
        size = small;
    } else if ([input isEqualToString:@"medium"]) {
        size = medium;
    } else if ([input isEqualToString:@"large"]) {
        size = large;
    } else {
        size = medium;
    }
    return size;
}

@end
