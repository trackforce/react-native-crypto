#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonKeyDerivation.h>

#import "Shared.h"
#import "Aes.h"

NSString const *kInitVector = @"pleaseginko12345";
size_t const kKeySize = kCCKeySizeAES128;

@implementation Aes

+ (NSData *) AES128CBC: (NSString *)operation data: (NSString *)data key: (NSString *)key iv: (NSString *)iv {
    // Convert hex string to hex data.
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    void const *initVectorBytes = [kInitVector dataUsingEncoding:NSUTF8StringEncoding].bytes;
    void const *contentBytes = [data dataUsingEncoding:NSUTF8StringEncoding].bytes;
    NSUInteger dataLength = [data dataUsingEncoding:NSUTF8StringEncoding].length;
    
    size_t operationSize = dataLength + kCCBlockSizeAES128;
    void *operationBytes = malloc(operationSize);
    if (operationBytes == NULL) {
        return nil;
    }
    size_t actualOutSize = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(
                                          [operation isEqualToString:@"encrypt"] ? kCCEncrypt : kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyData.bytes,
                                          kCCKeySizeAES128,
                                          initVectorBytes,
                                          contentBytes,
                                          dataLength,
//                                          buffer.mutableBytes,
                                          operationBytes,
                                          operationSize,
                                          &actualOutSize);

    if (cryptStatus == kCCSuccess) {
         return [NSData dataWithBytesNoCopy:operationBytes length:actualOutSize];
    }
    NSLog(@"AES error, %d", cryptStatus);
    return nil;
}

+ (NSString *) encrypt: (NSString *)clearText key: (NSString *)key iv: (NSString *)iv {
    NSData *result = [self AES128CBC:@"encrypt" data:clearText key:key iv:iv];
    NSLog(@"AES error, %@", result);
    return [result base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

+ (NSString *) decrypt: (NSString *)cipherText key: (NSString *)key iv: (NSString *)iv {
    NSData *result = [self AES128CBC:@"decrypt" data:[[NSData alloc] initWithBase64EncodedString:cipherText options:0] key:key iv:iv];
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

@end