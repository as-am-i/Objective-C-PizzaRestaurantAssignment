//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
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
            NSString *second = commandWords[1];
            PizzaSize size;
            
            if ([commandWords count] == 1 && [first isEqualToString:@"pepperoni"]) {
                [restaurantKitchen makelargePepperoni];
            } else if ([commandWords count] == 2 && [second isEqualToString:@"hawaiian"]) {
                size = [restaurantKitchen getSizeOfPizza:first];
                [restaurantKitchen makeHawaiianWithSize:size];
            } else {
                size = [restaurantKitchen getSizeOfPizza:first];
                
                NSMutableArray *mutableCommandWords = [NSMutableArray arrayWithArray:commandWords];
                [mutableCommandWords removeObjectAtIndex:0];
                NSArray *toppings = [mutableCommandWords copy];
                
                [restaurantKitchen makePizzaWithSize:size toppings:toppings];
            }
        }

    }
    return 0;
}

