//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-30.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "Manager.h"

@protocol DeliveryServiceDelegate <NSObject>
- (void) deliverPizza:(Pizza *)pizza;
@end

@interface DeliveryService : NSObject <ManagerDelegate>

// delegate property
@property (weak) id <DeliveryServiceDelegate> delegate;
@property NSMutableArray *allPizza;

- (NSMutableArray *) history;

@end
