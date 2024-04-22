import 'package:downloader/aplication/provider/download_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DownloadButton extends ConsumerWidget {
  const DownloadButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressDownload = ref.watch(downloadNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            ref.read(downloadNotifierProvider.notifier).startDownload(
                  "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_5mb.mp4",
                  "bunny30.mp4",
                );
          },
          child: Text('Download ${progressDownload.progress.toInt()} %'),
        ),
        LinearProgressIndicator(
          value: progressDownload.progress / 100,
          semanticsLabel: 'Linear progress indicator',
        ),
      ],
    );
  }
}
