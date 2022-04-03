import 'package:abtkar_app/generated/tr.dart';
import 'package:abtkar_app/modules/details/cubit/download_image_cubit.dart';
import 'package:abtkar_app/shared/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/queen.dart';

import '../../shared/components/alerts.dart';

class ImageDownloadScreen extends StatelessWidget {
  final String image;
  final String desc;

  const ImageDownloadScreen({Key? key, required this.image, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Tr.download.tr),
      body: Column(
        children: [
          Image.network(image),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                desc,
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
          BlocConsumer<DownloadImageCubit, DownloadImageState>(
             listener: (context, state) {
               if (state is DownloadImageSuccess) {
            Alert.success(Tr.downloadDone.tr);
          }
               if (state is DownloadImageError) {
            Alert.error(state.msg);
          }
               },
            builder: (context, state) {
               final cubit = BlocProvider.of<DownloadImageCubit>(context);
               return state is DownloadImageLoading
                   ? const Center(child: CircularProgressIndicator.adaptive())
                   : FloatingActionButton(
                  onPressed: () => cubit.saveImageInGallery(image: image),
                  child: const Icon(Icons.download),
                );
        },
      ),
    );
  }
}
