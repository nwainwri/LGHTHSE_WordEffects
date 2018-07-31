//
//  main.m
//  WordEffects
//
//  Created by Nathan Wainwright on 2018-07-30.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "extras.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        while (true) {
            
            int userChoice = 0;
            char userStringChoice[255];
            // NSString *canadaString = @""; // used to be ->> NSMutableString *canadaString = [[NSMutableString alloc] initWithString:@""];

            int wordLength = 0;
            
            printf("Input your choice (number): ");
            fgets(userStringChoice, 255, stdin);
            
            userChoice = atoi(userStringChoice); // converts userInput string, into a usable integer HAS NO ERROR CHECKING
            
            NSLog(@"User Inputting: %d",userChoice);
            
            // 255 unit long array of characters
            char inputChars[255];
            
            printf("Input a string: ");
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            inputChars[strlen(inputChars)-1] = '\0';
            
            // print as a c string
            printf("Your string is %s\n", inputChars);
            
            // convert char array to an NSString object
            NSMutableString *inputString = [NSMutableString stringWithUTF8String:inputChars]; //orginally just a NSString
            
            // print NSString object
            //NSLog(@"Input was: %@", inputString);
            
            // print out memory address used
            //NSLog(@"Memory Address was: %p", &inputString);
            
            char lastCharacter = inputChars[strlen(inputChars)-1];
            
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"]; // make a set of chars
            set = [set invertedSet]; // now invert that set to have anything BUT numbers
            NSRange range = [inputString rangeOfCharacterFromSet:set]; // take character set, then search said input for any matching chars
            
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
                    
                    if (range.location != NSNotFound) // if any chars match anything from INVERTED set, then "true", so hence "non numeric chars"
                    {
                        NSLog(@"String contains other non-numeric characters");
                    }
                    else
                    {
                        NSLog(@"Numberize: %d", [inputString intValue]);
                    }
                    break;
               
                case 4:
                    {
                        // Canadianize
                        NSString *middleGround = @"";
                        middleGround = [inputString stringByAppendingString:@", eh?"];
                        NSLog(@"Canadian: %@", middleGround);
                        break;
                    }
                case 5:
                    // Respond
                    if (lastCharacter == '?')
                    {
                        NSLog(@"I don't know");
                    }
                    else if (lastCharacter == '!')
                    {
                        NSLog(@"Whoa, calm down!");
                    }
                    break;
                    
                case 6:
                    // De-Space-It
                    NSLog (@"De-Space-It: %@", [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
                    break;
                    
                case 7:
                    // string length
                    wordLength = [inputString length];
                    NSLog(@"Length of String: %i", wordLength);
                    break;
                
                case 8:
                    NSLog(@"String, without any punctuation: %@", [inputString removeNonLetters]);
                    break;
                    
                default:
                    break;
                    
            }
        } // end while
    }
    return 0;
}
