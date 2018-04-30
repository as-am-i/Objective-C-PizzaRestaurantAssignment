//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-26.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, PizzaSize) {
    small,
    medium,
    large
};

@interface Pizza : NSObject

@property (readonly) PizzaSize size;
@property (readonly) NSArray *toppings;

- (instancetype) initWithSize:(PizzaSize)size andToppings:(NSArray *)toppings;
+ (Pizza *) largePepperoni;
+ (Pizza *) hawaiianWithSize:(PizzaSize)size;

- (NSString *) printAllToppings:(Pizza *) pizza;

@end
