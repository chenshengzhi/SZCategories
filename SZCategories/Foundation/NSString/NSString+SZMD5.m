//
//  NSString+SZMD5.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+SZMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SZMD5)

+ (NSString *)sz_stringWithMD5OfFile:(NSString *) path {

	NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
	if (handle == nil) {
		return nil;
	}
	
	CC_MD5_CTX md5;
	CC_MD5_Init (&md5);
	
	BOOL done = NO;
	
	while (!done) {
		NSData *fileData = [[NSData alloc] initWithData: [handle readDataOfLength: 4096]];
		CC_MD5_Update (&md5, [fileData bytes], (CC_LONG) [fileData length]);
		
		if ([fileData length] == 0) {
			done = YES;
		}
	}
	
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5_Final (digest, &md5);
	NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
				   digest[0],  digest[1], 
				   digest[2],  digest[3],
				   digest[4],  digest[5],
				   digest[6],  digest[7],
				   digest[8],  digest[9],
				   digest[10], digest[11],
				   digest[12], digest[13],
				   digest[14], digest[15]];
				   
	return s;
	
}

- (NSString *)sz_MD5Hash {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];
}

@end

