#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonKeyDerivation.h>

#import "Shared.h"
#import "Pbkdf2.h"

@implementation Pbkdf2

+ (NSString *) hash:(NSString *)password saltBase64: (NSString *)saltBase64 iterations: (int)iterations keyLen: (int)keyLen hash: (NSString *)hash  {
    // Data of String to generate Hash key(hexa decimal string).
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    NSData *saltData = [[NSData alloc]initWithBase64EncodedString:saltBase64 options:0];

    // Hash key (hexa decimal) string data length.
    NSMutableData *hashKeyData = [NSMutableData dataWithLength:keyLen];
    
    NSDictionary *algMap = @{
     @"SHA1" : [NSNumber numberWithInt:kCCPRFHmacAlgSHA1],
     @"SHA224" : [NSNumber numberWithInt:kCCPRFHmacAlgSHA224],
     @"SHA256" : [NSNumber numberWithInt:kCCPRFHmacAlgSHA256],
     @"SHA384" : [NSNumber numberWithInt:kCCPRFHmacAlgSHA384],
     @"SHA512" : [NSNumber numberWithInt:kCCPRFHmacAlgSHA512],
    };
    
    int alg = [[algMap valueForKey:hash] intValue];

    // Key Derivation using PBKDF2 algorithm.
    int status = CCKeyDerivationPBKDF(
                    kCCPBKDF2,
                    passwordData.bytes,
                    passwordData.length,
                    saltData.bytes,
                    saltData.length,
                    alg,
                    iterations,
                    hashKeyData.mutableBytes,
                    hashKeyData.length);

    if (status == kCCParamError) {
        NSLog(@"Key derivation error");
        return @"";
    }

    return [Shared toHex:hashKeyData];
}

@end
