//
//  main.m
//  WordEffects
//
//  Created by Nathan Wainwright on 2018-07-30.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        while (true) {
            
            int userChoice = 0;
            char userStringChoice[255];
            NSMutableString *canadaString = [[NSMutableString alloc] initWithString:@""];
            
            
            
            printf("Input your choice (number): ");
            fgets(userStringChoice, 255, stdin);
            
            userChoice = atoi(userStringChoice); // converts userInput string, into a usable integer HAS NO ERROR CHECKING
            
            NSLog(@"User Inputting: %d",userChoice);
            
            // 255 unit long array of characters
            char inputChars[255];
            
            printf("Input a string: ");
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            
            // print as a c string
            printf("Your string is %s\n", inputChars);
            
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            
            // print NSString object
            NSLog(@"Input was: %@", inputString);
            
            // print out memory address used
            NSLog(@"Memory Address was: %p", &inputString);
            
            switch (userChoice) {
                case 1:
                    // UPPER CASE
                    NSLog(@"UPPERCASED: %@", [inputString uppercaseString]);
                    break;
                
                case 2:
                    // LOWER CASE
                    NSLog(@"lowercased: %@", [inputString lowercaseString]);

                    break;
                    
                case 3:
                    // Numberize
                    NSLog(@"Numberize: %d", [inputString intValue]);
                    break;
               
                case 4:
                    // Canadianize
                    
                    [canadaString appendFormat:@"%@, eh?", inputString];
                    
                    NSLog(@"Canadian: %@", canadaString); //BUG ISSUES; WHY IS IT DROPPING APPEND STRING ON NEW LINE??
                    break;
                    
                case 5:
                    // Respond
                    
                    break;
                    
                case 6:
                    // De Space It
                    
                    NSLog (@"De-Space-It: %@", [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
                    break;
                    
                default:
                    break;
            }

        
        
        } // end while
    }
    return 0;
}
