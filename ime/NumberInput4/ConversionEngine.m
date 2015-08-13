/*

File:ConversionEngine.m

Abstract: A simple conversion engine.  This converts number strings into one of the formats supported by NSNumberFormatter.

Version: 1.0

*/
#import "ConversionEngine.h"


@implementation ConversionEngine

-(void)awakeFromNib
{
	[self setConversionMode:NSNumberFormatterDecimalStyle];
	
}

-(NSString*)convert:(NSString*)string
{
	// Allocate the formatter lazily
	// We want to use the 10.4 methods of NSNumberFormatter so we allocate it here and set the default behavior to the 10.4 behavior.
	// See comment below from documentation.
	
	/*
	Important:  The pre-Mac OS X v10.4 methods of NSNumberFormatter are not compatible with the methods added for Mac OS X v10.4. An NSNumberFormatter object should not invoke methods in these different behavior groups indiscriminately. Use the old-style methods if you have configured the number-formatter behavior to be NSNumberFormatterBehavior10_0. Use the new methods instead of the older-style ones if you have configured the number-formatter behavior to be NSNumberFormatterBehavior10_4.
	Note also that number formatters created in Interface Builder use the Mac OS X v10.0 behavior—see NSNumberFormatter on Mac OS X v10.4.
	*/
	
	if ( formatter == nil ) {
		// Specify that we want the modern 10.4 behavior
		[NSNumberFormatter setDefaultFormatterBehavior:NSNumberFormatterBehavior10_4];
		// Now allocate our formatter
		formatter = [[NSNumberFormatter alloc] init];		
	}
	// Convert the string into a number first
	// We set the conversion style each time in case it has changed.
	[formatter setNumberStyle:NSNumberFormatterNoStyle];
	
	NSNumber*		number = [formatter numberFromString:string];
	
	// Now convert the number to the right format string
	[formatter setNumberStyle:[self conversionMode]];
	return [formatter stringFromNumber:number];
}

-(NSNumberFormatterStyle)conversionMode {
	return conversionMode;
}

-(void)setConversionMode:(NSNumberFormatterStyle)mode
{
	conversionMode = mode;
}

@end
