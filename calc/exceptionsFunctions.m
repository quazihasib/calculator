//
//  NSObject+Exceptions.m
//  calc
//
//  Created by Quazi Ridwan Hasib on 25/5/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "exceptionsFunctions.h"

@implementation exceptionsFunctions:NSObject

//show the exception messages
-(void)exceptionHandleMessage:(NSString*)a
{
    NSException* myException = [NSException
                                exceptionWithName:@"Calculator Exceptions"
                                reason: [NSString stringWithFormat: @"%@", a]
                                userInfo:nil];
    @throw myException;

}

@end
