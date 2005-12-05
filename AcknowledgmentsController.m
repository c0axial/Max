/*
 *  $Id: ApplicationController.h 178 2005-11-26 20:27:04Z me $
 *
 *  Copyright (C) 2005 Stephen F. Booth <me@sbooth.org>
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

#import "AcknowledgmentsController.h"

static AcknowledgmentsController *sharedController = nil;

@implementation AcknowledgmentsController

+ (AcknowledgmentsController *) sharedController
{
	@synchronized(self) {
		if(nil == sharedController) {
			sharedController = [[self alloc] init];
		}
	}
	return sharedController;
}

+ (id) allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if(nil == sharedController) {
            return [super allocWithZone:zone];
        }
    }
    return sharedController;
}

- (id)init
{
	if((self = [super initWithWindowNibName:@"Acknowledgments"])) {
		return self;
	}
	return nil;
}

- (void) awakeFromNib
{
	[self setShouldCascadeWindows:NO];
	[self setWindowFrameAutosaveName:@"Acknowledgments"];	

	NSBundle	*bundle		= [NSBundle bundleForClass:[self class]];
	NSString	*path		= [bundle pathForResource:@"Acknowledgments" ofType:@"rtf"];
	if(nil != path) {
		[_text readRTFDFromFile:path];
	}	
}

- (id) copyWithZone:(NSZone *)zone								{ return self; }
- (id) retain													{ return self; }
- (unsigned) retainCount										{ return UINT_MAX;  /* denotes an object that cannot be released */ }
- (void) release												{ /* do nothing */ }
- (id) autorelease												{ return self; }

@end