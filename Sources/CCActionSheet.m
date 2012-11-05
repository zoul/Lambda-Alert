#import "CCActionSheet.h"

NSString *const CCActionSheetDismissAllSheetsNotification = @"CCActionSheetDismissAllSheetsNotification";
NSString *const CCActionSheetAnimatedKey = @"CCActionSheetAnimated";

@interface CCActionSheet () <UIActionSheetDelegate>
@property(strong) UIActionSheet *sheet;
@property(strong) NSMutableArray *blocks;
@property(strong) id keepInMemory;
@end

@implementation CCActionSheet
@synthesize sheet, blocks, dismissAction, keepInMemory;

- (id) initWithTitle: (NSString*) title
{
    self = [super init];
    sheet = [[UIActionSheet alloc] initWithTitle:title delegate:self
        cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    blocks = [[NSMutableArray alloc] init];
    return self;
}


#pragma mark Button Management

- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block
{
    if (!block) block = ^{};
    [sheet addButtonWithTitle:title];
    [blocks addObject:[block copy]];
}

- (void) addDestructiveButtonWithTitle: (NSString*) title block: (dispatch_block_t) block
{
    [self addButtonWithTitle:title block:block];
    [sheet setDestructiveButtonIndex:sheet.numberOfButtons-1];
}

- (void) addCancelButtonWithTitle: (NSString*) title block: (dispatch_block_t) block
{
    [self addButtonWithTitle:title block:block];
    [sheet setCancelButtonIndex:sheet.numberOfButtons-1];
}

- (void) addCancelButtonWithTitle: (NSString*) title
{
    [self addCancelButtonWithTitle:title block:NULL];
}

#pragma mark Display

- (void) subscribeForDismissNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(dismissFromNotification:)
        name:CCActionSheetDismissAllSheetsNotification
        object:nil];
}

- (void) dismissFromNotification: (NSNotification*) event
{
    id animated = [[event userInfo] objectForKey:CCActionSheetAnimatedKey];
    [self dismissAnimated:[animated boolValue]];
}

- (void) showInView: (UIView*) view
{
    [sheet showInView:view];
    [self setKeepInMemory:self];
    [self subscribeForDismissNotification];
}

- (void) showFromTabBar: (UITabBar*) view
{
    [sheet showFromTabBar:view];
    [self setKeepInMemory:self];
    [self subscribeForDismissNotification];
}

- (void) showFromToolbar: (UIToolbar*) view
{
    [sheet showFromToolbar:view];
    [self setKeepInMemory:self];
    [self subscribeForDismissNotification];
}

- (void) showFromBarButtonItem: (UIBarButtonItem*) item
{
    [sheet showFromBarButtonItem:item animated:YES];
    [self setKeepInMemory:self];
    [self subscribeForDismissNotification];
}

- (void) showFromRect: (CGRect) rect inView: (UIView*) view animated: (BOOL) animated
{
    [sheet showFromRect:rect inView:view animated:animated];
    [self setKeepInMemory:self];
    [self subscribeForDismissNotification];
}

- (void) dismissAnimated: (BOOL) animated
{
    [sheet dismissWithClickedButtonIndex:-1 animated:animated];
}

#pragma mark UIActionSheetDelegate

- (void) actionSheet: (UIActionSheet*) actionSheet didDismissWithButtonIndex: (NSInteger) buttonIndex
{
    NSParameterAssert(actionSheet == sheet);
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

@end
