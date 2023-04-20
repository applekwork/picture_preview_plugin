import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'picture_preview_plugin_platform_interface.dart';

/// An implementation of [PicturePreviewPluginPlatform] that uses method channels.
class MethodChannelPicturePreviewPlugin extends PicturePreviewPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('picture_preview_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
