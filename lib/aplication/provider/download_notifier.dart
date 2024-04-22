import 'package:downloader/data/notification_service.dart';
import 'package:downloader/domain/download_state.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:downloader/data/download_service.dart';

part 'download_notifier.g.dart';

@riverpod
class DownloadNotifier extends _$DownloadNotifier {
  @override
  DownloadState build() {
    return DownloadState.initial();
  }

  Future<void> startDownload(String url, String fileName) async {
    state = DownloadState.initial();
    final NotificationService notificationService = NotificationService();
    bool result = await DownloadService().startDownloading(
      url: url,
      fileName: fileName,
      onReceiveProgress: (received) {
        final bool isPaused =
            WidgetsBinding.instance.lifecycleState == AppLifecycleState.paused;
        state = DownloadState(progress: received);

        if (isPaused) {
          notificationService.showNotification(
              'Dowload Video', 'Dowload is active', received);
        } else {
          notificationService.cancelNotification();
        }
      },
    );
    if (result) {
      notificationService.cancelNotification();
      state = state.copyWith(isCompleted: true);
    }
  }
}
