//
//  ThirdManager.m
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-27.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ThirdManager.h"

@implementation ThirdManager

- (BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings{
    return YES;
}

- (BOOL) kitchenShouldUpgradeOrder:(Kitchen *)kitchen{
    return NO;
}

@end
