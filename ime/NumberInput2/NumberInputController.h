/*
File:NumberInputController.h

Abstract: Input controller header file.

Version: 1.0
*/

#import <Cocoa/Cocoa.h>
#import <InputMethodKit/InputMethodKit.h>

const NSString* kDecimalMode = @"com.apple.inputmethod.decimal";
const NSString* kCurrencyMode = @"com.apple.inputmethod.currency";
const NSString* kPercentMode = @"com.apple.inputmethod.percent";
const NSString* kScientificMode = @"com.apple.inputmethod.scientific";
const NSString* kSpelloutMode = @"com.apple.inputmethod.spellout";

@interface NumberInputController : IMKInputController 
{
		//_composedBuffer contains text that the input method has converted
		NSMutableString*				_composedBuffer;
		//_original buffer contains the text has it was received from user input.
		NSMutableString*				_originalBuffer;
		//used to mark where text is being inserted in the _composedBuffer
		NSInteger						_insertionIndex;
		//This flag indicates that the original text was converted once in response to a trigger (space key)
		//the next time the trigger is received the composition will be committed.
		BOOL							_didConvert;
}

// These are simple methods for managing our composition and original buffers.
// They are all simple wrappers around basic NSString methods.
-(NSMutableString*)composedBuffer;
-(void)setComposedBuffer:(NSString*)string;

-(NSMutableString*)originalBuffer;
-(void)originalBufferAppend:(NSString*)string client:(id)sender;
-(void)setOriginalBuffer:(NSString*)string;

- (BOOL)convert:(NSString*)trigger client:(id)sender;

@end
