import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yjy_sumsun_self_service/yjy_sumsun_self_service_method_channel.dart';

void main() {
  MethodChannelYjySumsunSelfService platform = MethodChannelYjySumsunSelfService();
  const MethodChannel channel = MethodChannel('yjy_sumsun_self_service');

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
