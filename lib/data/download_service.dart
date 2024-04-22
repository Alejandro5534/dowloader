import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class DownloadService {
  Future startDownloading({
    required String url,
    required String fileName,
    required void Function(double) onReceiveProgress,
  }) async {
    bool isSuccess = false;
    NotificationType notificationType = NotificationType.disabled;

    await FileDownloader.downloadFile(
      notificationType: notificationType,
      url: url,
      name: fileName,
      onProgress: (String? fileName, double progress) {
        onReceiveProgress(progress);
      },
      onDownloadCompleted: (path) {
        isSuccess = true;
      },
    );
    return isSuccess;
  }
}
