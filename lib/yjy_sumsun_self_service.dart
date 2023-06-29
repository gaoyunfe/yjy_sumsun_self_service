
import 'yjy_sumsun_self_service_platform_interface.dart';

class YjySumsunSelfService {
  Future<String?> getPlatformVersion() {
    return YjySumsunSelfServicePlatform.instance.getPlatformVersion();
  }
  Future<String?> getPlatformVersion2() {
    return YjySumsunSelfServicePlatform.instance.getPlatformVersion2();
  }
  Future<String?> bindService() {
    return YjySumsunSelfServicePlatform.instance.bindService();
  }
}
