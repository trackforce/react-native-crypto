#import "RCTSha.h"
#import "Sha.h"

@implementation RCTSha

RCT_EXPORT_MODULE()
 
RCT_EXPORT_METHOD(sha1:(NSString *)text
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Sha sha1:text];
    if (data == nil) {
        reject(@"sha1_fail", @"Hash error", error);
    } else {
        resolve(data);
    }
}

RCT_EXPORT_METHOD(sha256:(NSString *)text
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Sha sha256:text];
    if (data == nil) {
        reject(@"sha256_fail", @"Hash error", error);
    } else {
        resolve(data);
    }
}

RCT_EXPORT_METHOD(sha512:(NSString *)text
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSError *error = nil;
    NSString *data = [Sha sha512:text];
    if (data == nil) {
        reject(@"sha512_fail", @"Hash error", error);
    } else {
        resolve(data);
    }
}

@end
