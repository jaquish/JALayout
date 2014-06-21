

#import "JASizeConstraint.h"

@interface JASizeConstraint ()

@property (nonatomic) NSLayoutConstraint *constraintWidth;
@property (nonatomic) NSLayoutConstraint *constraintHeight;

@property (nonatomic, weak, readwrite) UIView *view;

@property (nonatomic) NSMutableArray *stack;

@end

// Maximum number of previous sizes that will be remembered
static const float MAX_STACK = 50;

@implementation JASizeConstraint

- (instancetype)initWithView:(UIView*)view size:(CGSize)size
{
    if (self = [super init]) {
        
        self.view = view;
        
        self.constraintWidth  = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth  relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:size.width];
        self.constraintHeight = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:size.height];
        
        self.stack = [NSMutableArray array];
        self.size = size;
    }
    
    return self;
}

- (void)setWidth:(CGFloat)width
{
    [self setSize:CGSizeMake(width, self.height)];
}

- (CGFloat)width
{
    return self.constraintWidth.constant;
}

- (void)setHeight:(CGFloat)height
{
    [self setSize:CGSizeMake(self.width, height)];
}

- (CGFloat)height
{
    return self.constraintHeight.constant;
}

- (void)setSize:(CGSize)size
{
    [self.stack addObject:NSStringFromCGSize(self.size)];  // save
    if ([self.stack count] > MAX_STACK) {
        [self.stack removeObjectAtIndex:0];
    }
    
    self.constraintWidth.constant = size.width;
    self.constraintHeight.constant = size.height;
}

- (CGSize)size
{
    return CGSizeMake(self.width, self.height);
}

- (NSArray *)constraints
{
    return @[self.constraintWidth, self.constraintHeight];
}

- (void)resizeToPreviousSize
{
    if ([self.stack count]) {
        CGSize s = CGSizeFromString([self.stack lastObject]);
        [self.stack removeLastObject];
        self.constraintWidth.constant = s.width;
        self.constraintHeight.constant = s.height;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ for view %@ has size %@", [super description], self.view, NSStringFromCGSize(self.size)];
}

@end
