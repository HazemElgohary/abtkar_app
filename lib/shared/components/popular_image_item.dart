import 'package:abtkar_app/modules/image_download/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PopularImageItem extends StatelessWidget {
  final String image;
  final String description;
  const PopularImageItem({Key? key,required this.image,required this.description,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(ImageDownloadScreen(image: image,desc: description,)),
      child: Material(
        elevation: 20,
        borderRadius: const BorderRadius.all(Radius.circular(8),),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description,maxLines: 6,overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      ),
    );
  }
}
