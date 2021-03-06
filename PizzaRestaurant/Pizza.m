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

- (NSString *) detailPizza:(Pizza *)pizza{
    NSString *detailTopping = [pizza allToppings:pizza];
    NSString *detailSize = [pizza pizzaSize:pizza];
    return [NSString stringWithFormat:@"Size: %@,\nToppings: %@", detailSize, detailTopping];
}

- (NSString *) allToppings:(Pizza *)pizza{
    NSString *stringPieces = @"";
    NSString *stringToPrint = @"";
    for (NSString *topping in [pizza toppings]) {
        if ([topping isEqualTo:[pizza toppings].lastObject]) {
            stringPieces = [NSString stringWithFormat:@"%@", topping];
        } else {
            stringPieces = [NSString stringWithFormat:@"%@, ", topping];
        }
        stringToPrint = [stringToPrint stringByAppendingString:stringPieces];
    }
    return stringToPrint;
}

- (NSString *) pizzaSize:(Pizza *)pizza{
    NSString *size = @"";
    switch ([pizza size]) {
        case 0:
            size = @"small";
            break;
        case 1:
            size = @"medium";
            break;
        case 2:
            size = @"large";
            break;
        default:
            break;
    }
    return size;
}
@end
