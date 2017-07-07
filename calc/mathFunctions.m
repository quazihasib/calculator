//
//  NSObject+mathFunctions.m
//  calc
//
//  Created by Quazi Ridwan Hasib on 15/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "mathFunctions.h"
#import "exceptionsFunctions.h"

@implementation mathFunctions:NSObject

//varifies if it is a number or not
-(BOOL)varifyNumbers:(NSString *)numbers
{
    NSUInteger lengthOfArr = [numbers length];
    //check if there is any + or - at first
    NSString *firstChar;
    if (lengthOfArr > 1 && ([numbers characterAtIndex:0] == '+' || [numbers characterAtIndex:0] == '-')){
        firstChar = [numbers substringFromIndex:1];
    }
    else{
        firstChar = numbers;
    }
    
    for(int i=0; i<[firstChar length]; i++){
        int charNum = (int) [firstChar characterAtIndex:i];
        if(charNum < '0' || charNum > '9'){
            return false;
        }
    }
    return true;
}

//varifies if it is a operator or not
-(BOOL)varifyOperators:(NSString *)operators
{
    if ([operators isEqualToString:@"+"] || [operators isEqualToString:@"-"] || [operators isEqualToString:@"x"] || [operators isEqualToString:@"/"] || [operators isEqualToString:@"%"]) {
        return true;
    }
    return false;
}

//calculate or evaluate the expression
-(long)evaluateExpression:(NSMutableArray *)number :(NSMutableArray *)operator {
    NSUInteger length = [operator count];
    
    //initialize the exception handler
    exceptionsFunctions *e = [[exceptionsFunctions alloc]init];
    
    //evaluate the array of numbers and operators
    //evaluate x,/,% first
    for (int i = 0; i < length; i++)
    {
        if([operator[i] isEqualToString:@"x"] || [operator[i] isEqualToString:@"/"] ||[operator[i] isEqualToString:@"%"]){
            
            NSNumber *num1 = number[i];
            NSNumber *num2 = number[i + 1];
            
            long result;
            if([operator[i] isEqualToString:@"x"]){
                result = num1.longValue * num2.longValue;
            }
            else if([operator[i] isEqualToString:@"/"]){
                //if exp is divided by zero
                if(num2.longValue == 0){
                    [e exceptionHandleMessage:@"Divided by zero"];
                }
                result = num1.longValue / num2.longValue;
            }
            else if ([operator[i] isEqualToString:@"%"]){
                if (num2.longValue == 0){
                    //if exp is divided by zero
                    [e exceptionHandleMessage:@"Divided by zero"];
                }
                result = num1.longValue % num2.longValue;
            }
            
            //if answer is out of bound
            if (result <= INT_MIN || result > INT_MAX) {
                [e exceptionHandleMessage:@"Out of bound"];
            }
            
            // replace the result and remove bumber and operator
            NSNumber *res = [[NSNumber alloc] initWithLongLong:result];
            [number replaceObjectAtIndex:i withObject:res];
            [number removeObjectAtIndex:i+1];
            [operator removeObjectAtIndex:i];
            length--;
            i--;
        }
    }
    
    // evaluate +,- second
    length = [operator count];
    for (int i = 0; i < length; i++)
    {
        NSNumber *num1 = number[i];
        NSNumber *num2 = number[i + 1];
        long result;
        
        if ([operator[i] isEqualToString:@"+"]){
            result = num1.longValue + num2.longValue;
        }
        else{
            result = num1.longValue - num2.longValue;
        }
        //if answer is out of bound
        if (result <= INT_MIN || result > INT_MAX){
             [e exceptionHandleMessage:@"Out of bound"];
        }
        // replace the result and remove num1 and num2 in the array
        NSNumber *res = [[NSNumber alloc] initWithLongLong:result];
        [number replaceObjectAtIndex:i withObject:res];
        [number removeObjectAtIndex:i+1];
        [operator removeObjectAtIndex:i];
        
        length--;
        i--;
    }
    
    //returning the final result
    NSNumber * finalResult;
    @try{
        finalResult= number[0];
    }
    @catch (NSException *exception){
        
    }
    @finally {
    }
    
    return finalResult.longValue;
}

@end
