/*
 *  $Id$
 *
 *  Copyright (C) 2005, 2006 Stephen F. Booth <me@sbooth.org>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#import <Cocoa/Cocoa.h>

#import <Growl/GrowlApplicationBridge.h>

@interface NSApplication (ScriptingAdditions)
- (id) handleConvertScriptCommand:(NSScriptCommand *)command;
@end

@interface ApplicationController : NSObject <GrowlApplicationBridgeDelegate>
{
	NSArray		*_allowedTypes;
}

+ (ApplicationController *)		sharedController;

- (IBAction)			showPreferences:(id)sender;
- (IBAction)			showAcknowledgments:(id)sender;
- (IBAction)			showComponentVersions:(id)sender;

- (IBAction)			toggleRipperWindow:(id)sender;
- (IBAction)			toggleConverterWindow:(id)sender;
- (IBAction)			toggleEncoderWindow:(id)sender;
- (IBAction)			toggleLogWindow:(id)sender;

- (IBAction)			checkForUpdate:(id)sender;
- (IBAction)			openHomeURL:(id)sender;

- (BOOL)				displayAlertIfNoOutputFormats;

- (IBAction)			encodeFile:(id)sender;

- (void)				encodeFiles:(NSArray *)filenames;

- (NSDictionary *)		registrationDictionaryForGrowl;

@end