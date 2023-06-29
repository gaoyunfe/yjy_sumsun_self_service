import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'yjy_sumsun_self_service_platform_interface.dart';

/// An implementation of [YjySumsunSelfServicePlatform] that uses method channels.
class MethodChannelYjySumsunSelfService extends YjySumsunSelfServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('yjy_sumsun_self_service');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getPlatformVersion2() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion2');
    return version;
  }

  @override
  Future<String?> bindService() async {
    final result = await methodChannel.invokeMethod<String>('bindService');
    return result;
  }
}
