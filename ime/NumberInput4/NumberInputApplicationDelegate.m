/*

File:NumberInputApplicationDelegate.m

Abstract: The input method's application delegate object.

Version: 1.0

 */
#import "NumberInputApplicationDelegate.h"


@implementation NumberInputApplicationDelegate

-(ConversionEngine*)conversionEngine
{
	return _conversionEngine;
}


//this method is added so that our controllers can access the shared NSMenu.
-(NSMenu*)menu
{
	return _menu;
}


//add an awakeFromNib item so that we can set the action method.  
//Note that any menuItems without an action will be disabled when
//displayed in the Text Input Menud.
-(void)awakeFromNib
{
	NSMenuItem*		preferences = [_menu itemWithTag:1];
	
	if ( preferences ) {
		[preferences setAction:@selector(showPreferences:)];
	}
	
}

@end
