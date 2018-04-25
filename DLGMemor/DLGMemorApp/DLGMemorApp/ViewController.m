//
//  ViewController.m
//  DLGMemorApp
//
//  Created by Liu Junqi on 4/25/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UILabel *lblUInt8;
@property (nonatomic, weak) IBOutlet UILabel *lblInt8;
@property (nonatomic, weak) IBOutlet UILabel *lblUInt16;
@property (nonatomic, weak) IBOutlet UILabel *lblInt16;
@property (nonatomic, weak) IBOutlet UILabel *lblUInt32;
@property (nonatomic, weak) IBOutlet UILabel *lblInt32;
@property (nonatomic, weak) IBOutlet UILabel *lblUInt64;
@property (nonatomic, weak) IBOutlet UILabel *lblInt64;
@property (nonatomic, weak) IBOutlet UILabel *lblFloat;
@property (nonatomic, weak) IBOutlet UILabel *lblDouble;

@property (nonatomic, weak) IBOutlet UITextField *tfUInt8;
@property (nonatomic, weak) IBOutlet UITextField *tfInt8;
@property (nonatomic, weak) IBOutlet UITextField *tfUInt16;
@property (nonatomic, weak) IBOutlet UITextField *tfInt16;
@property (nonatomic, weak) IBOutlet UITextField *tfUInt32;
@property (nonatomic, weak) IBOutlet UITextField *tfInt32;
@property (nonatomic, weak) IBOutlet UITextField *tfUInt64;
@property (nonatomic, weak) IBOutlet UITextField *tfInt64;
@property (nonatomic, weak) IBOutlet UITextField *tfFloat;
@property (nonatomic, weak) IBOutlet UITextField *tfDouble;

@property (nonatomic) uint8_t u8;
@property (nonatomic) int8_t d8;
@property (nonatomic) uint16_t u16;
@property (nonatomic) int16_t d16;
@property (nonatomic) uint32_t u32;
@property (nonatomic) int32_t d32;
@property (nonatomic) uint64_t u64;
@property (nonatomic) int64_t d64;
@property (nonatomic) float f;
@property (nonatomic) double d;

@property (nonatomic) uint8_t u8e;
@property (nonatomic) int8_t d8e;
@property (nonatomic) uint16_t u16e;
@property (nonatomic) int16_t d16e;
@property (nonatomic) uint32_t u32e;
@property (nonatomic) int32_t d32e;
@property (nonatomic) uint64_t u64e;
@property (nonatomic) int64_t d64e;
@property (nonatomic) float fe;
@property (nonatomic) double de;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self onRandomAllTapped:nil];
    [self startTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setU8:(uint8_t)u8 {
    _u8 = u8;
    self.u8e = u8 + 1;
}

- (void)setD8:(int8_t)d8 {
    _d8 = d8;
    self.d8e = d8 + 1;
}

- (void)setU16:(uint16_t)u16 {
    _u16 = u16;
    self.u16e = u16 + 1;
}

- (void)setD16:(int16_t)d16 {
    _d16 = d16;
    self.d16e = d16 + 1;
}

- (void)setU32:(uint32_t)u32 {
    _u32 = u32;
    self.u32e = u32 + 1;
}

- (void)setD32:(int32_t)d32 {
    _d32 = d32;
    self.d32e = d32 + 1;
}

- (void)setU64:(uint64_t)u64 {
    _u64 = u64;
    self.u64e = u64 + 1;
}

- (void)setD64:(int64_t)d64 {
    _d64 = d64;
    self.d64e = d64 + 1;
}

- (void)setF:(float)f {
    _f = f;
    self.fe = f + 1;
}

- (void)setD:(double)d {
    _d = d;
    self.de = d + 1;
}

- (IBAction)onChangeUInt8Tapped:(id)sender {
    self.u8 = [self.tfUInt8.text integerValue];
    [self.tfUInt8 resignFirstResponder];
}

- (IBAction)onChangeInt8Tapped:(id)sender {
    self.d8 = [self.tfInt8.text integerValue];
    [self.tfInt8 resignFirstResponder];
}

- (IBAction)onChangeUInt16Tapped:(id)sender {
    self.u16 = [self.tfUInt16.text integerValue];
    [self.tfUInt16 resignFirstResponder];
}

- (IBAction)onChangeInt16Tapped:(id)sender {
    self.d16 = [self.tfInt16.text integerValue];
    [self.tfInt16 resignFirstResponder];
}

- (IBAction)onChangeUInt32Tapped:(id)sender {
    self.u32 = [self.tfUInt32.text integerValue];
    [self.tfUInt32 resignFirstResponder];
}

- (IBAction)onChangeInt32Tapped:(id)sender {
    self.d32 = [self.tfInt32.text integerValue];
    [self.tfInt32 resignFirstResponder];
}

- (IBAction)onChangeUInt64Tapped:(id)sender {
    self.u64 = [self.tfUInt64.text integerValue];
    [self.tfUInt64 resignFirstResponder];
}

- (IBAction)onChangeInt64Tapped:(id)sender {
    self.d64 = [self.tfInt64.text integerValue];
    [self.tfInt64 resignFirstResponder];
}

- (IBAction)onChangeFloatTapped:(id)sender {
    self.f = [self.tfFloat.text integerValue];
    [self.tfFloat resignFirstResponder];
}

- (IBAction)onChangeDoubleTapped:(id)sender {
    self.d = [self.tfDouble.text integerValue];
    [self.tfDouble resignFirstResponder];
}

- (IBAction)onRandomAllTapped:(id)sender {
    self.u8 = arc4random_uniform(UINT8_MAX);
    self.d8 = arc4random_uniform(UINT8_MAX) - INT8_MAX;
    self.u16 = arc4random_uniform(UINT16_MAX);
    self.d16 = arc4random_uniform(UINT16_MAX) - INT16_MAX;
    self.u32 = arc4random_uniform(UINT32_MAX);
    self.d32 = arc4random_uniform(UINT32_MAX) - INT32_MAX;
    self.u64 = arc4random_uniform(UINT32_MAX);
    self.d64 = arc4random_uniform(UINT32_MAX) - INT32_MAX;
    self.f = arc4random_uniform(UINT16_MAX) / 100.0f;
    self.d = arc4random_uniform(UINT16_MAX) / 10000.0f;
}

- (void)startTimer {
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(checkValueTimer:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)checkValueTimer:(NSTimer *)timer {
    if (self.u8 + 1 == self.u8e) self.lblUInt8.text = [NSString stringWithFormat:@"%u", self.u8];
    else self.lblUInt8.text = [NSString stringWithFormat:@"Cheat: %u", self.u8];
    if (self.d8 + 1 == self.d8e) self.lblInt8.text = [NSString stringWithFormat:@"%d", self.d8];
    else self.lblInt8.text = [NSString stringWithFormat:@"Cheat: %d", self.d8];
    if (self.u16 + 1 == self.u16e) self.lblUInt16.text = [NSString stringWithFormat:@"%u", self.u16];
    else self.lblUInt16.text = [NSString stringWithFormat:@"Cheat: %u", self.u16];
    if (self.d16 + 1 == self.d16e) self.lblInt16.text = [NSString stringWithFormat:@"%d", self.d16];
    else self.lblInt16.text = [NSString stringWithFormat:@"Cheat: %d", self.d16];
    if (self.u32 + 1 == self.u32e) self.lblUInt32.text = [NSString stringWithFormat:@"%u", self.u32];
    else self.lblUInt32.text = [NSString stringWithFormat:@"Cheat: %u", self.u32];
    if (self.d32 + 1 == self.d32e) self.lblInt32.text = [NSString stringWithFormat:@"%d", self.d32];
    else self.lblInt32.text = [NSString stringWithFormat:@"Cheat: %d", self.d32];
    if (self.u64 + 1 == self.u64e) self.lblUInt64.text = [NSString stringWithFormat:@"%llu", self.u64];
    else self.lblUInt64.text = [NSString stringWithFormat:@"Cheat: %llu", self.u64];
    if (self.d64 + 1 == self.d64e) self.lblInt64.text = [NSString stringWithFormat:@"%lld", self.d64];
    else self.lblInt64.text = [NSString stringWithFormat:@"Cheat: %lld", self.d64];
    if (self.f + 1 == self.fe) self.lblFloat.text = [NSString stringWithFormat:@"%f", self.f];
    else self.lblFloat.text = [NSString stringWithFormat:@"Cheat: %f", self.f];
    if (self.d + 1 == self.de) self.lblDouble.text = [NSString stringWithFormat:@"%f", self.d];
    else self.lblDouble.text = [NSString stringWithFormat:@"Cheat: %f", self.d];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.tfUInt8) [self onChangeUInt8Tapped:nil];
    else if (textField == self.tfInt8) [self onChangeInt8Tapped:nil];
    else if (textField == self.tfUInt16) [self onChangeUInt16Tapped:nil];
    else if (textField == self.tfInt16) [self onChangeInt16Tapped:nil];
    else if (textField == self.tfUInt32) [self onChangeUInt32Tapped:nil];
    else if (textField == self.tfInt32) [self onChangeInt32Tapped:nil];
    else if (textField == self.tfUInt64) [self onChangeUInt64Tapped:nil];
    else if (textField == self.tfInt64) [self onChangeInt64Tapped:nil];
    else if (textField == self.tfFloat) [self onChangeFloatTapped:nil];
    else if (textField == self.tfDouble) [self onChangeDoubleTapped:nil];
    else [textField resignFirstResponder];
    return YES;
}

@end
