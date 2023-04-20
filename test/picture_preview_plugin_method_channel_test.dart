import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:picture_preview_plugin/picture_preview_plugin_method_channel.dart';

void main() {
  MethodChannelPicturePreviewPlugin platform = MethodChannelPicturePreviewPlugin();
  const MethodChannel channel = MethodChannel('picture_preview_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
