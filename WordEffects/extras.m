//
//  extras.m
//  WordEffects
//
//  Created by Nathan Wainwright on 2018-07-30.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import "extras.h"

// this will return to self; a string without puncuation; first by making a set of the letters, then inverting that to EVERYTHING else
// then rejoining that searching string with no spaces @""

// WHERE I GOT CODE FROM ; http://www.codecodex.com/wiki/Remove_non-letters_from_a_string#Objective-C

@implementation NSString (RemoveNonLetters)
- (NSString *)removeNonLetters {
    return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
}
@end
