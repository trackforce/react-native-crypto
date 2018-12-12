#import "RCTPbkdf2.h"
#import "lib/Pbkdf2.h"

@implementation RCTPbkdf2

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(hash:(NSString *)password saltBase64:(NSString *)saltBase64 iterations:(int)iterations keyLen:(int)keyLen hash:(NSString *)hash
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Pbkdf2 hash:password saltBase64:saltBase64 iterations:iterations keyLen:keyLen hash:hash];
    if (data == nil) {
        reject(@"keygen_fail", @"Key generation failed", error);
    } else {
        resolve(data);
    }
}
@end
