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

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        Manager *anchoviesHater = [Manager new];
        SecondManager *pizzaLover = [SecondManager new];
        ThirdManager *normalManager = [ThirdManager new];
        
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
                    continue;
                } else if ([second isEqualToString:@"Jesus"] || [second isEqualToString:@"jesus"]) {
                    [restaurantKitchen setDelegate:pizzaLover];
                    continue;
                } else if ([second isEqualToString:@"Nobody"] || [second isEqualToString:@"nobody"]) {
                    [restaurantKitchen setDelegate:normalManager];
                    continue;
                }
            } else if ([commandWords count] == 1 && [first isEqualToString:@"pepperoni"]) {
                if ([restaurantKitchen makelargePepperoni]) {
                    NSLog(@"Here is your pizza: Pepperoni");
                }
                
            } else if ([commandWords count] == 2 && [second isEqualToString:@"hawaiian"]) {
                size = [restaurantKitchen getSizeOfPizza:first];
                if ([restaurantKitchen makeHawaiianWithSize:size]) {
                    NSLog(@"Here is your pizza: Hawaiian");
                }
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
                }
                
                size = [restaurantKitchen getSizeOfPizza:first];
                
                NSMutableArray *mutableCommandWords = [NSMutableArray arrayWithArray:commandWords];
                [mutableCommandWords removeObjectAtIndex:0];
                NSArray *toppings = [mutableCommandWords copy];
                
                if ([restaurantKitchen makePizzaWithSize:size toppings:toppings]) {
                    NSLog(@"Here is your pizza: Custome one");
                }
            }
        }

    }
    return 0;
}

