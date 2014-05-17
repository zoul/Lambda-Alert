extern NSString *const CCActionSheetDismissAllSheetsNotification;
extern NSString *const CCActionSheetAnimatedKey;

/**
 A simple `UIActionSheet` wrapper with blocks-based API.
 The memory management works as in `UIActionSheet`: you don’t have
 to hold a strong reference to a `CCActionSheet`, it will retain
 itself when it’s displayed and release after being dismissed.
 All button action blocks may be `NULL`.
*/
@interface CCActionSheet : NSObject

/**
 Block to be called after the sheet is dismissed by whatever means.

 The dismiss action is called regardless of the method you use to
 dismiss the sheet, be it a regular button tap, cancel button tap
 or the `dismissAnimated` method.
*/
@property(copy) dispatch_block_t dismissAction;

/** The title may be `nil`. */
- (id) initWithTitle: (NSString*) title;

/** Adds a plain button. */
- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;

/**
 Adds a destructive button.

 The visual interpretation of a “destructive” button is up to the system,
 currently there’s some red color used to tell it apart from the regular buttons.
 iOS only supports adding at most one destructive button per one sheet.
*/
- (void) addDestructiveButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;

/**
 Adds a custom-action cancel button.

 The given block is executed before the `dismissAction`. iOS only supports
 one cancel button per sheet, please don’t try to add multiple buttons by calling
 this method.
*/
- (void) addCancelButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;

/**
 Adds a cancel button.

 iOS only supports one cancel button per sheet, please don’t try to add
 multiple buttons by calling this method.
*/
- (void) addCancelButtonWithTitle: (NSString*) title;

- (void) showFromTabBar: (UITabBar*) view;
- (void) showFromToolbar: (UIToolbar*) view;
- (void) showInView: (UIView*) view;
- (void) showFromBarButtonItem: (UIBarButtonItem*) item;
- (void) showFromRect: (CGRect) rect inView: (UIView*) view animated: (BOOL) animated;

/**
 Dismiss the sheet.

 If there’s a cancel button, dismissing using this method will not call the
 cancel button’s action, but `dismissAction` will be called (if set).
*/
- (void) dismissAnimated: (BOOL) animated;

@end
