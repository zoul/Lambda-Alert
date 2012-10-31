#import "CCAlertView.h"

NSString *const CCAlertViewDismissAllAlertsNotification = @"CCAlertViewDismissAllAlertsNotification";
NSString *const CCAlertViewAnimatedKey = @"CCAlertViewAnimated";

@interface CCAlertView () <UIAlertViewDelegate>
@property(strong) UIAlertView *alert;
@property(strong) NSMutableArray *blocks;
@property(strong) id keepInMemory;
@end

@implementation CCAlertView
@synthesize alert, blocks, dismissAction, keepInMemory;

- (id) initWithTitle: (NSString*) title message: (NSString*) message
{
    self = [super init];
    alert = [[UIAlertView alloc] initWithTitle:title message:message
        delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    blocks = [[NSMutableArray alloc] init];
    return self;
}

- (void) show
{
    [alert show];
    [self setKeepInMemory:self];
    [[NSNotificationCenter defaultCenter]
        addObserverForName:CCAlertViewDismissAllAlertsNotification
        object:nil queue:nil usingBlock:^(NSNotification *event) {
        id animated = [[event userInfo] objectForKey:CCAlertViewAnimatedKey];
        [self dismissAnimated:[animated boolValue]];
    }];
}

- (void) dismissAnimated: (BOOL) animated
{
    [alert dismissWithClickedButtonIndex:-1 animated:animated];
}

- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block
{
    if (!block) block = ^{};
    [alert addButtonWithTitle:title];
    [blocks addObject:[block copy]];
}

- (void) alertView: (UIAlertView*) alertView didDismissWithButtonIndex: (NSInteger) buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < [blocks count]) {
        dispatch_block_t block = [blocks objectAtIndex:buttonIndex];
        block();
    }
    if (dismissAction != NULL) {
        dismissAction();
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self setKeepInMemory:nil];
}

- (UITextField*) textFieldAtIndex: (NSInteger) textFieldIndex
{
    if ([alert respondsToSelector:@selector(textFieldAtIndex:)]) {
        return [alert textFieldAtIndex:textFieldIndex];
    } else {
        return nil;
    }
}

- (void) setAlertViewStyle: (UIAlertViewStyle) alertViewStyle
{
    if ([alert respondsToSelector:@selector(alertViewStyle)]) {
        [alert setAlertViewStyle:alertViewStyle];
    }
}

#pragma mark - Convenience methods

+ (id) alertWithTitle:(NSString *)title message:(NSString *)message
{
	return [[self alloc] initWithTitle:title message:message];
}

+ (id) alertWithTitle:(NSString *)title
{
	return [[self alloc] initWithTitle:title message:nil];
}

+ (id) alertWithMessage:(NSString *)message
{
	return [[self alloc] initWithTitle:nil message:message];
}

+ (void) showAlertWithTitle:(NSString *)title message:(NSString *)message block:(dispatch_block_t)block
{
	CCAlertView *alert = [self alertWithTitle:title message:message];
	[alert addButtonWithTitle:@"OK" block:block];
	[alert show];
}

+ (void) showAlertWithTitle:(NSString *)title block:(dispatch_block_t)block
{
	[self showAlertWithTitle:title message:nil block:block];
}

+ (void) showAlertWithMessage:(NSString *)message block:(dispatch_block_t)block
{
	[self showAlertWithTitle:nil message:message block:block];
}

+ (void) showAlertWithTitle:(NSString *)title message:(NSString *)message
{
	[self showAlertWithTitle:title message:message block:nil];
}

+ (void) showAlertWithTitle:(NSString *)title
{
	[self showAlertWithTitle:title block:nil];
}

+ (void) showAlertWithMessage:(NSString *)message
{
	[self showAlertWithMessage:message block:nil];
}

@end
