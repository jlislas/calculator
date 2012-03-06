//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Luis Islas on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain() 
// NSMutableArray Allows a lot of methods to add or remove
   @property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack=_operandStack; // Create the setter and getter for us

// Override the getter to acts as a creator *** implemented thru synthetize

- (NSMutableArray *) operandStack{
    if (_operandStack == nil) {
        // Alloc the memory space and then call the super class method init
        // Lazy instantiation
        _operandStack = [[NSMutableArray alloc] init ];
    }
    return _operandStack;
}


//- (void) setOperandStack:(NSMutableArray *)operandStack{
//    _operandStack=operandStack;
//}


- (double) popOperand{
    NSNumber *operandObject=[self.operandStack objectAtIndex:0];
    if (operandObject) // (operandObject != nil)
        [self.operandStack removeObjectAtIndex:0];
    return [operandObject doubleValue];
}


- (void) pushOperand:(double)operand{
    // NSNumber *operandObject= [NSNumber numberWithDouble:operand];
    // [self.operandStack addObject:operandObject];
    // If you want you can include this in one single line
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double) performOperation:(NSString *) operation{
    double result=0;
    if ([operation isEqualToString:@"+"]){
        result=[self popOperand] + [self popOperand];
    }else if ([@"-" isEqualToString:operation]){
        result=[self popOperand] - [self popOperand];
    }else if ([@"*" isEqualToString:operation]){
        result=[self popOperand] * [self popOperand];
    }else if ([@"/" isEqualToString:operation]){
        result=[self popOperand] / [self popOperand];
    }else if ([@"sqrt" isEqualToString:operation]){
        result=sqrt([self popOperand]);
    }else if ([@"sin" isEqualToString:operation]){
        result=sin([self popOperand]);
    }else if ([@"cos" isEqualToString:operation]){
        result=cos([self popOperand]);
    }
    // push the result back in the stack
    [self pushOperand:result];
    
    return result;
}

@end
