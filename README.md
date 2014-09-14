# NSString+CommonMarkdown

NSString category to use CommonMarkdown c implementation as a method of NSString. It defines the following method:

```
/*
Returns the html result from the markdown string 
or nil if there are errors during the conversion
*/
- (NSString*)cmd_htmlRepresentation:(NSError**)error
```

## Errors

(very basic, needs to be be improved)

Errors will be treated as Parse or Generator errors in the same domain:

```
extern NSString* const CMDMarkdownGenerationErrorDomain;
extern const NSInteger CMDMarkdownParserErrorCode;
extern const NSInteger CMDMarkdownGeneratorErrorCode;
```

