
#import <Foundation/Foundation.h>

@interface JASizeConstraint : NSObject

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGSize  size;
@property (nonatomic, weak, readonly) UIView *view;

- (instancetype)initWithView:(UIView*)view size:(CGSize)size;

- (NSArray*)constraints;

- (void)resizeToPreviousSize;

@end
