//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Manager.h"
#import "SecondManager.h"
#import "ThirdManager.h"
#import "DeliveryService.h"
#import "DeliveryCar.h"

#import "InputCollector.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        Manager *anchoviesHater = [Manager new];
        SecondManager *pizzaLover = [SecondManager new];
        ThirdManager *normalManager = [ThirdManager new];
        DeliveryService *deliveryService = [DeliveryService new];
        DeliveryCar *deliverCar = [DeliveryCar new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            // And then send some message to the kitchen...
            NSString *first = commandWords[0];
            NSString *second;
            if ([commandWords count] > 1) {
                second = commandWords[1];
            }
            PizzaSize size;
            
            if ([commandWords count] == 2 && [first isEqualToString:@"call"]) {
                if ([second isEqualToString:@"Asami"] || [second isEqualToString:@"asami"]) {
                    [restaurantKitchen setDelegate:anchoviesHater];
                    [anchoviesHater setDelegate:deliveryService];
                } else if ([second isEqualToString:@"Jesus"] || [second isEqualToString:@"jesus"]) {
                    [restaurantKitchen setDelegate:pizzaLover];
                    [pizzaLover setDelegate:deliveryService];
                } else if ([second isEqualToString:@"Nobody"] || [second isEqualToString:@"nobody"]) {
                    [restaurantKitchen setDelegate:normalManager];
                    [normalManager setDelegate:deliveryService];
                }
                [deliveryService setDelegate:deliverCar];
                continue;
            } else if ([commandWords count] == 1 && [first isEqualToString:@"wine"]) {
                NSLog(@"You can get drunk tonight🍷");
                continue;
            } else if ([commandWords count] == 1 && ([first isEqualToString:@"coke"] || [first isEqualToString:@"pepsi"])) {
                NSLog(@"Enjoy 🍾 with pizza!");
                continue;
            } else {
                // when user haven't called any manager
                if (restaurantKitchen.delegate == nil) {
                    [restaurantKitchen setDelegate:normalManager];
                    [normalManager setDelegate:deliveryService];
                    [deliveryService setDelegate:deliverCar];
                }
                
                Pizza *newPizza;
                if ([commandWords count] == 1 && [first isEqualToString:@"pepperoni"]) {
                    newPizza = [restaurantKitchen makelargePepperoni];
                } else if ([commandWords count] == 2 && [second isEqualToString:@"hawaiian"]) {
                    size = [restaurantKitchen getSizeOfPizza:first];
                    newPizza = [restaurantKitchen makeHawaiianWithSize:size];
                } else {
                    size = [restaurantKitchen getSizeOfPizza:first];
                    
                    NSMutableArray *mutableCommandWords = [NSMutableArray arrayWithArray:commandWords];
                    [mutableCommandWords removeObjectAtIndex:0];
                    NSArray *toppings = [mutableCommandWords copy];
                    
                    newPizza = [restaurantKitchen makePizzaWithSize:size toppings:toppings];
                }
                
                if (newPizza) {
                    for (NSString *detail in [deliveryService history]) {
                        [InputCollector printToPrompt:detail];
                    }
                } else {
                    NSLog(@"Woops! Someone declined your order!");
                }
            }
        }

    }
    return 0;
}

