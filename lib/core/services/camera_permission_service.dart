import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionService {
  static final CameraPermissionService instance = CameraPermissionService._();
  CameraPermissionService._();

  ph.PermissionStatus permission = ph.PermissionStatus.denied;

  Future<PermissionStatus> requestPermission() async {
    permission = await ph.Permission.camera.request();
    if (permission.isPermanentlyDenied) {
      openAppSettings().then((value) async {
        if (value) {
          if (await Permission.camera.status.isPermanentlyDenied == true &&
              await Permission.camera.status.isGranted == false) {
            openAppSettings();
          }
        }
      });
    }
    return permission;
  }

  Future<bool> execute() async {
    var result = false;
    final permissionStatus = await requestPermission();
    if (permissionStatus.isGranted) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }
}
