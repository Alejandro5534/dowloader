class DownloadState {
  final double progress;

  final bool isCompleted;

  DownloadState({this.progress = 0, this.isCompleted = false});

  DownloadState.initial() : this();

  DownloadState copyWith({double? progress, bool? isCompleted}) {
    return DownloadState(
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
