#import "ViSharePlugin.h"
#import <vi_share/vi_share-Swift.h>

@implementation ViSharePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftViSharePlugin registerWithRegistrar:registrar];
}
@end
