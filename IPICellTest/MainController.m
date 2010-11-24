//
//  MainController.m
//  IPICellTest
//
//  Created by Andreas on 23.01.07.
//  Copyright 2007 Andreas Mayer. All rights reserved.
//

#import "MainController.h"
#import "AMIndeterminateProgressIndicatorCell.h"
#import "AMProgressIndicatorTableColumnController.h"


@implementation MainController

- (void)awakeFromNib
{
	[mainWindow setContentAspectRatio:NSMakeSize(1.0, 1.0)];
	AMIndeterminateProgressIndicatorCell *cell = [[[AMIndeterminateProgressIndicatorCell alloc] init] autorelease];
	[testControl setCell:cell];
	[testControl1 setCell:cell];
	[testControl2 setCell:cell];
	[cell setSpinning:YES];
	
	NSTimer *theTimer = [[NSTimer scheduledTimerWithTimeInterval:[cell animationDelay] target:self selector:@selector(animate:) userInfo:NULL repeats:YES] retain];
	// keep running while menu is open
	[[NSRunLoop currentRunLoop] addTimer:theTimer forMode:NSEventTrackingRunLoopMode];

	cell = [[[AMIndeterminateProgressIndicatorCell alloc] init] autorelease];
	[cell setDisplayedWhenStopped:NO];
	[progressColumn setDataCell:cell];
	AMProgressIndicatorTableColumnController *controller = [[AMProgressIndicatorTableColumnController alloc] initWithTableColumn:progressColumn];
	[controller startAnimation];
}

- (void)changeColorTo:(NSColor *)color
{
	[[testControl cell] setColor:color];
	[[progressColumn dataCell] setColor:color];
}

- (IBAction)changeColor:(id)sender
{
	[self changeColorTo:[sender color]];
}

- (void)animate:(NSTimer *)aTimer
{	double value = fmod(([[testControl cell] doubleValue] + (5.0/60.0)), 1.0);
	[[testControl cell] setDoubleValue:value];
	[testControl setNeedsDisplay:YES];
	[testControl1 setNeedsDisplay:YES];
	[testControl2 setNeedsDisplay:YES];
}

- (int)numberOfRowsInTableView:(NSTableView *)aTableView
{
	return 30;
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(int)rowIndex
{
	id result = nil;
	if (aTableColumn == progressColumn) {
		result = [NSNumber numberWithBool:(rowIndex % 2)];
	} else {
		result = [NSString stringWithFormat:@"Row %i", rowIndex];
	}
	return result;
}


@end
