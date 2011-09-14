@interface LambdaSheet : NSObject

@property(copy) dispatch_block_t dismissAction;

- (id) initWithTitle: (NSString*) title;

- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;
- (void) addDestructiveButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;
- (void) addCancelButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;
- (void) addCancelButtonWithTitle: (NSString*) title;

- (void) showFromTabBar: (UITabBar*) view;
- (void) showFromToolbar: (UIToolbar*) view;
- (void) showInView: (UIView*) view;
- (void) showFromBarButtonItem: (UIBarButtonItem*) item;
- (void) showFromRect: (CGRect) rect inView: (UIView*) view animated: (BOOL) animated;

- (void) dismissAnimated: (BOOL) animated;

@end
