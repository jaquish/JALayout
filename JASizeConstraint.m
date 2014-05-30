

#import "JASizeConstraint.h"

@interface JASizeConstraint ()

@property (nonatomic) NSLayoutConstraint *constraintWidth;
@property (nonatomic) NSLayoutConstraint *constraintHeight;

@property (nonatomic, weak, readwrite) UIView *view;

@end

@implementation JASizeConstraint

- (instancetype)initWithView:(UIView*)view size:(CGSize)size
{
    if (self = [super init]) {
        
        self.view = view;
        
        self.constraintWidth  = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth  relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:size.width];
        self.constraintHeight = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:size.height];
        
        [self.view addConstraint:self.constraintHeight];
        [self.view addConstraint:self.constraintWidth];
        
        self.size = size;
    }
    
    return self;
}

- (void)setWidth:(CGFloat)width
{
    self.constraintWidth.constant = width;
}

- (CGFloat)width
{
    return self.constraintWidth.constant;
}

- (void)setHeight:(CGFloat)height
{
    self.constraintHeight.constant = height;
}

- (CGFloat)height
{
    return self.constraintHeight.constant;
}

- (void)setSize:(CGSize)size
{
    self.width = size.width;
    self.height = size.height;
}

- (CGSize)size
{
    return CGSizeMake(self.width, self.height);
}

- (NSArray *)constraints
{
    return @[self.constraintWidth, self.constraintHeight];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ for view %@ has size %@", [super description], self.view, NSStringFromCGSize(self.size)];
}

@end
