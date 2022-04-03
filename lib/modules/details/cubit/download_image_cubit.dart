import 'dart:developer';
import 'dart:math' hide log;
import 'package:abtkar_app/services/dowload_image.dart';
import 'package:bloc/bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:queen/locators.dart';

part 'download_image_state.dart';

class DownloadImageCubit extends Cubit<DownloadImageState> {
  DownloadImageCubit() : super(DownloadImageInitial());

  final service = Locators.find<ImageServices>();

  Future<void> saveImageInGallery({
    required String image,
  }) async{
   await [Permission.storage].request();
    try{
      emit(DownloadImageLoading());
      int count = Random().nextInt(1000);
      final name = 'Image$count';
     await ImageGallerySaver.saveImage(
          await service.getImage(image),
          name: name);
      emit(DownloadImageSuccess());
    }
    catch(e,st){
      log(e.toString());
      log(st.toString());
      emit(DownloadImageError(e.toString()));
    }

  }
}
