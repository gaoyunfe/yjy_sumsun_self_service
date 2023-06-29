import 'package:flutter_test/flutter_test.dart';
import 'package:yjy_sumsun_self_service/yjy_sumsun_self_service.dart';
import 'package:yjy_sumsun_self_service/yjy_sumsun_self_service_platform_interface.dart';
import 'package:yjy_sumsun_self_service/yjy_sumsun_self_service_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockYjySumsunSelfServicePlatform
    with MockPlatformInterfaceMixin
    implements YjySumsunSelfServicePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getPlatformVersion2() {
    // TODO: implement getPlatformVersion2
    throw UnimplementedError();
  }

  @override
  Future<String?> bindService() {
    // TODO: implement bindService
    throw UnimplementedError();
  }
}

void main() {
  final YjySumsunSelfServicePlatform initialPlatform = YjySumsunSelfServicePlatform.instance;

  test('$MethodChannelYjySumsunSelfService is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelYjySumsunSelfService>());
  });

  test('getPlatformVersion', () async {
    YjySumsunSelfService yjySumsunSelfServicePlugin = YjySumsunSelfService();
    MockYjySumsunSelfServicePlatform fakePlatform = MockYjySumsunSelfServicePlatform();
    YjySumsunSelfServicePlatform.instance = fakePlatform;

    expect(await yjySumsunSelfServicePlugin.getPlatformVersion(), '42');
  });
}
