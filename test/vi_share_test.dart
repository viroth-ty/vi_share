import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vi_share/vi_share.dart';

void main() {
  const MethodChannel channel = MethodChannel('vi_share');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ViShare.platformVersion, '42');
  });
}
