#import "GeopluginPlugin.h"
#import <geoplugin/geoplugin-Swift.h>

@implementation GeopluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGeopluginPlugin registerWithRegistrar:registrar];
}
@end
