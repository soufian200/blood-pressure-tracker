import 'package:permission_handler/permission_handler.dart';

class Permissions {
  ///
  /// Ask user for permissions
  static Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      return result == PermissionStatus.granted;
    }
  }

  static Future<bool> requestStorage() async {
    return await requestPermission(Permission.storage);
  }
}
