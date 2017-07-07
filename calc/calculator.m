//
//  NSObject+calculator.m
//  calc
//
//  Created by Quazi Ridwan Hasib on 10/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "calculator.h"
#import "mathFunctions.h"
#import "exceptionsFunctions.h"

@implementation calculator:NSObject


//calculate or evaluate the expression
-(void) evaluateExpression:(int)argCounter :(const char **)argVector
{
    NSMutableArray *number = [[NSMutableArray alloc] init];
    NSMutableArray *operator = [[NSMutableArray alloc] init];
    
    //initialize the math & exception functions
    mathFunctions *m = [[mathFunctions alloc]init];
    exceptionsFunctions *e = [[exceptionsFunctions alloc]init];
    //varify the numbers
    for(int i=1; i<argCounter; i=i+2)
    {
        NSString *numbers = [[NSString alloc] initWithCString:argVector[i] encoding:NSUTF8StringEncoding];
        if ([m varifyNumbers:numbers]) {
            //if the integer is out of bound
            long resultNumber = numbers.longLongValue;
            if (resultNumber <= INT_MIN || resultNumber > INT_MAX) {
                [e exceptionHandleMessage:@"Out of bound"];
            }
            
            NSNumber * n = [[NSNumber alloc] initWithLongLong:numbers.longLongValue];
            [number addObject:n];
        } else {
            [e exceptionHandleMessage:@"Invalid input"];
        }
    }
    
    //varify the operators
    for (int j=2; j<argCounter; j=j+2){
        NSString *operators = [[NSString alloc] initWithCString:argVector[j] encoding:NSUTF8StringEncoding];
        if ([m varifyOperators:operators]) {
            [operator addObject:operators];
        } else {
           [e exceptionHandleMessage:@"Invalid input"];
        }
    }
    
    // calculate and print result
    long answer = 0;
    
    answer = [m evaluateExpression:number :operator];
    //NSLog(@"answer:%ld",answer);
    printf("%ld", answer);
}


@end
