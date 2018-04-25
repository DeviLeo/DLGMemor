//
//  DLGMemUIViewCell.m
//  memui
//
//  Created by Liu Junqi on 4/24/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#import "DLGMemUIViewCell.h"

@interface DLGMemUIViewCell ()

@property (nonatomic) UILabel *lblAddress;
@property (nonatomic) UILabel *lblValue;
@property (nonatomic) UITextField *tfValue;
@property (nonatomic) UIButton *btnMod;
@property (nonatomic) UIButton *btnViewMemory;

@end

@implementation DLGMemUIViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initAll];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initAll];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initAll];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initAll];
    }
    return self;
}

- (void)initAll {
    [self initUI];
}

- (void)initUI {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.textLabel.textColor = [UIColor whiteColor];
    [self initSplitLine];
    [self initAddressLabel];
    [self initValueLabel];
    [self initViewMemoryButton];
    [self initModButton];
    [self initValueInput];
}

- (void)initSplitLine {
    UIImageView *iv = [[UIImageView alloc] init];
    iv.translatesAutoresizingMaskIntoConstraints = NO;
    iv.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:iv];
    
    NSDictionary *views = @{@"iv":iv};
    NSArray *ch = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[iv]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:ch];
    NSArray *cv = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[iv(1)]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:cv];
}

- (void)initAddressLabel {
    UILabel *lbl = [[UILabel alloc] init];
    lbl.translatesAutoresizingMaskIntoConstraints = NO;
    lbl.backgroundColor = [UIColor clearColor];
    lbl.textAlignment = NSTextAlignmentLeft;
    lbl.textColor = [UIColor whiteColor];
    lbl.text = @"Address";
    [self.contentView addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl};
    NSArray *ch = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[lbl(128)]" options:0 metrics:nil views:views];
    [self.contentView addConstraints:ch];
    NSArray *cv = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[lbl]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:cv];
    
    self.lblAddress = lbl;
}

- (void)initValueLabel {
    UILabel *lbl = [[UILabel alloc] init];
    lbl.translatesAutoresizingMaskIntoConstraints = NO;
    lbl.backgroundColor = [UIColor clearColor];
    lbl.textAlignment = NSTextAlignmentLeft;
    lbl.textColor = [UIColor whiteColor];
    lbl.text = @"Value";
    [self.contentView addSubview:lbl];
    
    NSDictionary *views = @{@"addr":self.lblAddress, @"lbl":lbl};
    NSArray *ch = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[addr]-8-[lbl]" options:0 metrics:nil views:views];
    [self.contentView addConstraints:ch];
    NSArray *cv = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[lbl]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:cv];
    
    self.lblValue = lbl;
}

- (void)initViewMemoryButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn setTitle:@"V" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onViewMemoryButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
    NSDictionary *views = @{@"btn":btn};
    NSArray *ch = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[btn(32)]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:ch];
    NSArray *cv = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[btn]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:cv];
    
    self.btnViewMemory = btn;
}

- (void)initModButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn setTitle:@"M" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onModButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
    NSDictionary *views = @{@"lbl":self.lblValue, @"btn":btn, @"vm":self.btnViewMemory};
    NSArray *ch = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lbl]-8-[btn(32)]-8-[vm]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:ch];
    NSArray *cv = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[btn]|" options:0 metrics:nil views:views];
    [self.contentView addConstraints:cv];
    
    self.btnMod = btn;
}

- (void)initValueInput {
    UITextField *tf = [[UITextField alloc] init];
    tf.translatesAutoresizingMaskIntoConstraints = NO;
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.backgroundColor = [UIColor whiteColor];
    tf.textColor = [UIColor blackColor];
    tf.placeholder = @"New value";
    tf.returnKeyType = UIReturnKeyDone;
    tf.keyboardType = UIKeyboardTypeDefault;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    tf.spellCheckingType = UITextSpellCheckingTypeNo;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tf.autocorrectionType = UITextAutocorrectionTypeNo;
    tf.enabled = YES;
    tf.hidden = YES;
    [self.contentView addSubview:tf];
    
    NSDictionary *views = @{@"lbl":self.lblAddress, @"btn":self.btnMod, @"tf":tf};
    NSArray *ch = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lbl]-8-[tf]-8-[btn]" options:0 metrics:nil views:views];
    [self.contentView addConstraints:ch];
    NSArray *cv = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[tf]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    [self.contentView addConstraints:cv];
    
    self.tfValue = tf;
}

#pragma mark - Setter / Getter
- (void)setAddress:(NSString *)address {
    _address = address;
    self.lblAddress.text = address;
}

- (void)setValue:(NSString *)value {
    _value = value;
    self.lblValue.text = value;
    self.tfValue.text = value;
}

- (void)setModifying:(BOOL)modifying {
    _modifying = modifying;
    self.tfValue.text = self.value;
    self.lblValue.hidden = modifying;
    self.tfValue.hidden = !modifying;
    [self.btnMod setTitle:modifying ? @"OK" : @"M" forState:UIControlStateNormal];
}

- (void)setTextFieldDelegate:(id<UITextFieldDelegate>)textFieldDelegate {
    _textFieldDelegate = textFieldDelegate;
    self.tfValue.delegate = textFieldDelegate;
}

#pragma mark - Events
- (void)onModButtonTapped:(id)sender {
    if (self.modifying) {
        [self.tfValue resignFirstResponder];
        NSString *text = self.tfValue.text;
        if (text.length == 0) return;
        self.value = text;
        if ([self.delegate respondsToSelector:@selector(DLGMemUIViewCellModify:value:)]) {
            [self.delegate DLGMemUIViewCellModify:self.address value:self.value];
        }
    }
    self.modifying = !self.modifying;
}

- (void)onViewMemoryButtonTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(DLGMemUIViewCellViewMemory:)]) {
        [self.delegate DLGMemUIViewCellViewMemory:self.address];
    }
}

@end
