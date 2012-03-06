//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Luis Islas on 2/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInMiddleOfEnteringANumber;
@property (nonatomic) BOOL enteringAPoint;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController
@synthesize display=_display;
@synthesize userIsInMiddleOfEnteringANumber=_userIsInMiddleOfEnteringANumber;
@synthesize enteringAPoint=_enteringAPoint;
@synthesize brain=_brain;

-(CalculatorBrain *) brain{
    if (!_brain)
        _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

-(BOOL) containsAPoint:(NSString *)stringToSearchWithin{
    BOOL found=NO;
    if ([stringToSearchWithin rangeOfString:@"."].location != NSNotFound) {
        found = YES;
    }

    return found;
}
- (IBAction)pointIsPressed:(UIButton *)sender {
    if (![self containsAPoint:self.display.text]){
        self.display.text=[self.display.text stringByAppendingString:@"."];        
        self.userIsInMiddleOfEnteringANumber=YES;
    }    
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit=[sender currentTitle];
    NSLog(@"Digit pressed= %@", digit);
    // to shrink the code.. we will use self.display instead
    // UILabel *myDisplay = self.display; // [self display]; // Setter
    // Also currentText is removed
    //NSString *currentText=[self.display text];
    // Also we don't need a new variable.. newText.. just take it
    //NSString *newText=[currentText stringByAppendingString:digit];
    //self.display.text=newText;  //[myDisplay setText:newText];  // Getter
    // self.display.text=[currentText stringByAppendingString:digit];
    
    // My display text = my display text append the digits
    if (self.userIsInMiddleOfEnteringANumber){
       self.display.text=[self.display.text stringByAppendingString:digit];        
    }else{
        self.display.text=digit;
        self.userIsInMiddleOfEnteringANumber=YES;
    }

}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInMiddleOfEnteringANumber=NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    NSString *operation=[sender currentTitle];
    NSLog(@"Operation pressed= %@", operation);
    if (self.userIsInMiddleOfEnteringANumber)
        [self enterPressed];
    double result=[self.brain performOperation:sender.currentTitle];
    self.display.text=[NSString stringWithFormat:@"%g",result];
    
}

@end
