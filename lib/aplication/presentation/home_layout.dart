import 'package:downloader/aplication/presentation/widgets/dowload_button.dart';
import 'package:downloader/aplication/provider/downloader_permissions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeLayout extends ConsumerWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionStatus = ref.watch(downloaderPermissionsProvider);
    return Scaffold(
      body: Center(
        child: permissionStatus != PermissionStatus.granted
            ? ElevatedButton(
                onPressed: () {
                  ref
                      .read(downloaderPermissionsProvider.notifier)
                      .callPermission();
                },
                child: const Text('Allow storage permission'))
            : const DownloadButton(),
      ),
    );
  }
}
