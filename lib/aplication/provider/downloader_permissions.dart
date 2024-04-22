import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
part 'downloader_permissions.g.dart';

@riverpod
class DownloaderPermissions extends _$DownloaderPermissions {
  @override
  PermissionStatus build() {
    callPermission();
    return PermissionStatus.denied;
  }

  callPermission() async {
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
    state = await Permission.storage.status;
  }
}
