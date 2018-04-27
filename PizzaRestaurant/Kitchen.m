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
    Pizza *newPizza = [[Pizza alloc] initWithSize:size andToppings:toppings];
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
