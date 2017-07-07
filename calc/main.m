//
//  main.m
//  calc
//

#import <Foundation/Foundation.h>
#import "calculator.h"
#import "mathFunctions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        //start calculator 
        calculator *c = [[calculator alloc]init];
        [c evaluateExpression :argc: argv];
    }
    return 0;
}
