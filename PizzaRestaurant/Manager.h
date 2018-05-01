//
//  Manager.h
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-27.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"


@protocol ManagerDelegate <NSObject>
- (void) deliverPizza:(Pizza *)pizza;
@end

@interface Manager : NSObject <KitchenDelegate>

// delegate property
@property (weak) id <ManagerDelegate> delegate;

@end
