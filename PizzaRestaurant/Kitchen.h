//
//  Kitchen.h
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"

// defining Kitchen type to use for the methods in KitchenDelegate
@class Kitchen;

@protocol KitchenDelegate <NSObject>

- (BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;
- (BOOL) kitchenShouldUpgradeOrder:(Kitchen *)kitchen;

@optional
- (void) kitchenDidMakePizza:(Pizza *)pizza;

@end

@interface Kitchen : NSObject

// delegate property
@property (weak) id <KitchenDelegate> delegate;

- (Pizza *) makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings;
- (Pizza *) makelargePepperoni;
- (Pizza *) makeHawaiianWithSize:(PizzaSize)size;

- (PizzaSize) getSizeOfPizza:(NSString *)input;

@end
