import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'picture_preview_plugin_method_channel.dart';

abstract class PicturePreviewPluginPlatform extends PlatformInterface {
  /// Constructs a PicturePreviewPluginPlatform.
  PicturePreviewPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PicturePreviewPluginPlatform _instance = MethodChannelPicturePreviewPlugin();

  /// The default instance of [PicturePreviewPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPicturePreviewPlugin].
  static PicturePreviewPluginPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PicturePreviewPluginPlatform] when
  /// they register themselves.
  static set instance(PicturePreviewPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
