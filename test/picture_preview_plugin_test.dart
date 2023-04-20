import 'package:flutter_test/flutter_test.dart';
import 'package:picture_preview_plugin/picture_preview_plugin.dart';
import 'package:picture_preview_plugin/picture_preview_plugin_platform_interface.dart';
import 'package:picture_preview_plugin/picture_preview_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPicturePreviewPluginPlatform 
    with MockPlatformInterfaceMixin
    implements PicturePreviewPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PicturePreviewPluginPlatform initialPlatform = PicturePreviewPluginPlatform.instance;

  test('$MethodChannelPicturePreviewPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPicturePreviewPlugin>());
  });

  test('getPlatformVersion', () async {
    PicturePreviewPlugin picturePreviewPlugin = PicturePreviewPlugin();
    MockPicturePreviewPluginPlatform fakePlatform = MockPicturePreviewPluginPlatform();
    PicturePreviewPluginPlatform.instance = fakePlatform;
  
    expect(await picturePreviewPlugin.getPlatformVersion(), '42');
  });
}
