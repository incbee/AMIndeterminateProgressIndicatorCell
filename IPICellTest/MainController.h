//
//  MainController.h
//  IPICellTest
//
//  Created by Andreas on 23.01.07.
//  Copyright 2007 Andreas Mayer. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MainController : NSObject {
	IBOutlet NSControl *testControl;
	IBOutlet NSControl *testControl1;
	IBOutlet NSControl *testControl2;
	IBOutlet NSWindow *mainWindow;
	IBOutlet NSTableColumn *progressColumn;
}

- (IBAction)changeColor:(id)sender;


@end
