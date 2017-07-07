//
//  NSObject+mathFunctions.h
//  calc
//
//  Created by Quazi Ridwan Hasib on 15/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mathFunctions:NSObject

//varifies if it is a number or not
-(BOOL)varifyNumbers:(NSString *)numbers;
//varifies if it is a operator or not
-(BOOL)varifyOperators:(NSString *)operators;
//calculate or evaluate the expression
-(long)evaluateExpression:(NSMutableArray *)number :(NSMutableArray *)opr ;
@end
