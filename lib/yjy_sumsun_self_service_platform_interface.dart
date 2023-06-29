import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'yjy_sumsun_self_service_method_channel.dart';

abstract class YjySumsunSelfServicePlatform extends PlatformInterface {
  /// Constructs a YjySumsunSelfServicePlatform.
  YjySumsunSelfServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static YjySumsunSelfServicePlatform _instance = MethodChannelYjySumsunSelfService();

  /// The default instance of [YjySumsunSelfServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelYjySumsunSelfService].
  static YjySumsunSelfServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [YjySumsunSelfServicePlatform] when
  /// they register themselves.
  static set instance(YjySumsunSelfServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<String?> getPlatformVersion2() {
    throw UnimplementedError('platformVersion2() has not been implemented.');
  }

  Future<String?> bindService() {
    throw UnimplementedError('bindService() has not been implemented.');
  }
}
