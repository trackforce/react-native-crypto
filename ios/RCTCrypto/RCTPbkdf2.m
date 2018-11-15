#import "RCTPbkdf2.h"
#import "Pbkdf2.h"

@implementation RCTPbkdf2

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(hash:(NSString *)password salt:(NSString *)salt iterations:(int)iterations keyLen:(int)keyLen hash:(NSString *)hash
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Pbkdf2 hash:password salt:salt iterations:iterations keyLen:keyLen hash:hash];
    if (data == nil) {
        reject(@"keygen_fail", @"Key generation failed", error);
    } else {
        resolve(data);
    }
}
@end
