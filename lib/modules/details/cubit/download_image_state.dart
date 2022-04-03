part of 'download_image_cubit.dart';

@immutable
abstract class DownloadImageState {}

class DownloadImageInitial extends DownloadImageState {}
class DownloadImageLoading extends DownloadImageState {}
class DownloadImageSuccess extends DownloadImageState {}
class DownloadImageError extends DownloadImageState {
  final String msg;

  DownloadImageError(this.msg);
}
