//
//  NSString+CommonMarkdown.m
//  Objc-CommonMark-Binding
//
//  Created by Jesús on 14/09/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

#import "NSString+CommonMarkdown.h"
#import "bstrlib.h"
#import "stmd.h"

NSString * const CMDMarkdownGenerationErrorDomain = @"CMDMarkdownParseErrorDomain";
const NSInteger CMDMarkdownParserErrorCode = 100;
const NSInteger CMDMarkdownGeneratorErrorCode = 200;

@implementation NSString (CommonMarkdown)

- (NSString*)cmd_htmlRepresentation:(NSError**)error
{
    NSString *html;
    NSArray *lines = [self componentsSeparatedByString:@"\n"];
    
    __block block * cur = make_document();
    
    [lines enumerateObjectsUsingBlock:^(NSString *line, NSUInteger idx, BOOL *stop) {
        bstring s = NULL;
        s = bfromcstr([[line stringByAppendingString:@"\n"] cStringUsingEncoding:NSUTF8StringEncoding]);
        BOOL result = incorporate_line(s, idx, &cur);
        if (result != 0) {
            *error = [self cmd_parseErrorWithCode:CMDMarkdownParserErrorCode userInfo:nil];
            *stop = YES;
        }
        bdestroy(s);
    }];
    
    if (error == NULL) {
        while (cur != cur->top) {
            finalize(cur, [lines count]);
            cur = cur->parent;
        }
        finalize(cur, [lines count]);
        
        process_inlines(cur, cur->attributes.refmap);
        
        bstring result;
        if (blocks_to_html(cur, &result, false) != 0) {
            *error = [self cmd_parseErrorWithCode:CMDMarkdownGeneratorErrorCode userInfo:nil];
        } else {
            char *cString = bstr2cstr(result, '\0');
            html = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
            bcstrfree(cString);
        }
    }
    free_blocks(cur);
    
    return html;
}


- (NSError*)cmd_parseErrorWithCode:(NSInteger)code userInfo:(NSDictionary*)userInfo
{
    return [NSError errorWithDomain:CMDMarkdownGenerationErrorDomain code:code userInfo:userInfo];
}

@end
