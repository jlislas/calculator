//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Luis Islas on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void) pushOperand:(double)operand;
- (double) performOperation:(NSString *) operation;
@end
