@interface Application : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
}

@property(retain) IBOutlet UIWindow *window;

- (IBAction) showDemoAlert;
- (IBAction) showDemoActionSheet;

@end

