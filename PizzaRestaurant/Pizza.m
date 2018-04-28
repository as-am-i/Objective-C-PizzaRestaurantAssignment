//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-26.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype) initWithSize:(PizzaSize)size andToppings:(NSArray *)toppings{
    self = [super init];
    if (self) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}

+ (Pizza *) largePepperoni{
    NSArray *toppings = [[NSArray alloc] initWithObjects:@"pepperoni", nil];
    Pizza *largePepperoni = [[Pizza alloc] initWithSize:large andToppings:toppings];
    return largePepperoni;
}
+ (Pizza *) hawaiianWithSize:(PizzaSize)size{
    NSArray *toppings = [[NSArray alloc] initWithObjects:@"pineapple", @"bacon", nil];
    Pizza *hawaiian = [[Pizza alloc] initWithSize:size andToppings:toppings];
    return hawaiian;
}

@end
