import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    const settingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initializationSettings =
        InitializationSettings(android: settingsAndroid, iOS: null);
    _notificationsPlugin.initialize(initializationSettings);
  }

  showNotification(String title, String body, double received) {
    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        '0',
        'Download video',
        channelDescription: 'Dowload is active',
        importance: Importance.high,
        onlyAlertOnce: true,
        showProgress: true,
        maxProgress: 100,
        enableVibration: true,
        progress: received.toInt(),
      ),
    );
    _notificationsPlugin.show(0, title, body, notificationDetails);
  }

  cancelNotification() {
    _notificationsPlugin.cancel(0);
  }
}
