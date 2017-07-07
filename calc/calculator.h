//
//  NSObject+calculator.h
//  calc
//
//  Created by Quazi Ridwan Hasib on 10/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calculator:NSObject

//calculate or evaluate the expression
-(void) evaluateExpression:(int)argCounter :(const char **)argVector;

@end


