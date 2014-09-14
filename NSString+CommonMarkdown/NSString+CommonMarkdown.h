//
//  NSString+CommonMarkdown.h
//  Objc-CommonMark-Binding
//
//  Created by Jesús on 14/09/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const CMDMarkdownGenerationErrorDomain;
extern const NSInteger CMDMarkdownParserErrorCode;
extern const NSInteger CMDMarkdownGeneratorErrorCode;

@interface NSString (CommonMarkdown)

/*
 Returns the html result from the markdown string
 or nil if there are errors during the conversion
 */
- (NSString*)cmd_htmlRepresentation:(NSError**)error;

@end
