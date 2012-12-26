λ-alert
-------

This repo contains two simple wrappers around `UIAlertView` and `UIActionSheet`
that allow you to use blocks for actions, so that you don’t have to mess with
delegate callbacks and button indexes.

Installing
----------

This project includes a `podspec` for usage with [CocoaPods](http://cocoapods.org/). Simply add

    pod 'Lambda-Alert'

to your `Podfile` and run `pod install`.

Alternately, you can add all of the files contained in this project's `Library` directory to your Xcode project. If your project does not use ARC, you will need to enable ARC on these files. You can enable ARC per-file by adding the -fobjc-arc flag, as described on [a common StackOverflow question](http://stackoverflow.com/questions/6646052/how-can-i-disable-arc-for-a-single-file-in-a-project).

Finally, you could clone the whole repository and drag the project to an Xcode workspace. Then you can add libLambdaAlert to the list of linked libraries for your target and start using the code.

Usage
-----

Displaying an alert:

    CCAlertView *alert = [[CCAlertView alloc]
        initWithTitle:@"Test Alert"
        message:@"See if the thing works."];
    [alert addButtonWithTitle:@"Foo" block:^{ NSLog(@"Foo"); }];
    [alert addButtonWithTitle:@"Bar" block:^{ NSLog(@"Bar"); }];
    [alert addButtonWithTitle:@"Cancel" block:NULL];
    [alert show];

Displaying a sheet:

    CCActionSheet *sheet = [[CCActionSheet alloc] initWithTitle:@"Action Sheet"];
    [sheet addButtonWithTitle:@"Miles" block:^{ NSLog(@"Trumpet"); }];
    [sheet addButtonWithTitle:@"Trane" block:^{ NSLog(@"Saxophone"); }];
    [sheet addDestructiveButtonWithTitle:@"Monk" block:^{ NSLog(@"Piano"); }];
    [sheet addCancelButtonWithTitle:@"Back to the Head"];
    [sheet showInView:window];

The alert will keep itself from being deallocated until closed.

Extra features
--------------

* Both classes feature a `dismissAction` block that will be called when the
  dialog is dismissed, be it with a button tap, cancelling or dismissing
  through the `-dismissAnimated:` method.
* Both classes have a `-dismissAnimated:` method that will dismiss the dialog
  without pressing any of the buttons. This method does not perform the cancel
  button action, but it *does* call the `dismissAction` block mentioned in the
  previous bullet.
* You can also dismiss the dialog by posting a notification to the standard
  notification center. The name of the notification is documented in the header
  files. If you want the dismissal to be animated, include a `userInfo`
  dictionary with the notification that returns an appropriate `NSNumber`
  instance for `CCActionSheetAnimatedKey` or `CCAlertViewAnimatedKey`. The
  notification triggers `-dismissAnimated:`, so the notes above apply.

Links
-----

* [Programming with C Blocks][1] by Joachim Bengtsson
* [Practical Blocks][2] by Mike Ash

[1]: http://thirdcog.eu/pwcblocks/
[2]: http://www.mikeash.com/pyblog/friday-qa-2009-08-14-practical-blocks.html

Author & License
----------------

Licensed under the terms of the [MIT License][mit]:

Copyright © Tomáš Znamenáček, <tomas.znamenacek@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

The software is provided “as is”, without warranty of any kind, express or
implied, including but not limited to the warranties of merchantability,
fitness for a particular purpose and noninfringement. In no event shall the
authors or copyright holders be liable for any claim, damages or other
liability, whether in an action of contract, tort or otherwise, arising from,
out of or in connection with the Software or the use or other dealings in
the Software.

[mit]: http://www.opensource.org/licenses/mit-license.php
