//
//  secondManager.h
//  PizzaRestaurant
//
//  Created by 谷井朝美 on 2018-04-27.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "Manager.h"

@interface SecondManager : NSObject <KitchenDelegate>

// delegate property
@property (weak) id <ManagerDelegate> delegate;

@end
