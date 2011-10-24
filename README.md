λ-alert
-------

This repo contains two simple wrappers around `UIAlertView` and `UIActionSheet`
that allow you to use blocks for actions, so that you don’t have to mess with
delegate callbacks and button indexes.

Installing
----------

You can clone the whole repository and drag the project to an Xcode workspace.
Then you can add libLambdaAlert to the list of linked libraries for your target
and start using the code.

Usage
-----

Displaying an alert:

    LambdaAlert *alert = [[LambdaAlert alloc]
        initWithTitle:@"Test Alert"
        message:@"See if the thing works."];
    [alert addButtonWithTitle:@"Foo" block:^{ NSLog(@"Foo"); }];
    [alert addButtonWithTitle:@"Bar" block:^{ NSLog(@"Bar"); }];
    [alert addButtonWithTitle:@"Cancel" block:NULL];
    [alert show];

Displaying a sheet:

    LambdaSheet *sheet = [[LambdaSheet alloc] initWithTitle:@"Action Sheet"];
    [sheet addButtonWithTitle:@"Miles" block:^{ NSLog(@"Trumpet"); }];
    [sheet addButtonWithTitle:@"Trane" block:^{ NSLog(@"Saxophone"); }];
    [sheet addDestructiveButtonWithTitle:@"Monk" block:^{ NSLog(@"Piano"); }];
    [sheet addCancelButtonWithTitle:@"Back to the Head"];
    [sheet showInView:window];

The memory management works as with the wrapped classes: you may release the
alert/sheet after displaying and it will get released after dismissing. See the
demo project and source for details.

Links
-----

* [Programming with C Blocks][1] by Joachim Bengtsson
* [Practical Blocks][2] by Mike Ash

[1]: http://thirdcog.eu/pwcblocks/
[2]: http://www.mikeash.com/pyblog/friday-qa-2009-08-14-practical-blocks.html

Author & License
----------------

Licensed under the terms of the [MIT License][mit]:

Copyright (c) 2010–2011 Tomáš Znamenáček, <zoul@fleuron.cz>

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
