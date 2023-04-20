
import 'picture_preview_plugin_platform_interface.dart';

class PicturePreviewPlugin {
  Future<String?> getPlatformVersion() {
    return PicturePreviewPluginPlatform.instance.getPlatformVersion();
  }
}
