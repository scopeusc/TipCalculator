//
//  ViewController.m
//  TipCalcObjectiveC
//
//  Created by Suraya Shivji on 9/20/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegments;
@property (weak, nonatomic) IBOutlet UIView *manView;

@property (nonatomic, assign) int numPeople;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.billLabel.textAlignment = NSTextAlignmentRight;
    self.tipLabel.alpha = 0;
    self.totalLabel.alpha = 0;
    self.tipSegments.alpha = 0;
    self.manView.hidden = YES;
    self.numPeople = 1;
    [self.billLabel becomeFirstResponder];
}

- (IBAction)updateTip:(id)sender {
    [UIView animateWithDuration:0.6 animations:^{
        self.manView.hidden = NO;
        self.tipLabel.alpha = 0.9;
        self.totalLabel.alpha = 1;
        self.tipSegments.alpha = 1;
    }];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    float billAmount = [self.billLabel.text floatValue];
    NSArray *tipAmounts = @[@(0.15), @(0.20), @(0.25)];
    float tipAmount =  billAmount * [tipAmounts[self.tipSegments.selectedSegmentIndex] floatValue];
    float total = (billAmount + tipAmount) / (self.numPeople);
    
    self.tipLabel.text = [formatter stringFromNumber: @(tipAmount)]; // @() changes float to nsnumber
    self.totalLabel.text = [formatter stringFromNumber: @(total)];
}

- (IBAction)manClicked:(UIButton *)sender {
    if(sender.alpha < 1) {
        sender.alpha = 1;
        self.numPeople++;
    } else {
        sender.alpha = 0.3;
        self.numPeople--;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTipIndex = [defaults integerForKey:@"defaultTipIndex"];
    self.tipSegments.selectedSegmentIndex = defaultTipIndex;
    [self updateTip:self];
    
}


@end
