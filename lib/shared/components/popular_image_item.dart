import 'package:abtkar_app/modules/image_download/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queen/queen.dart';

class PopularImageItem extends StatelessWidget {
  final String image;
  final String description;
  final String name;

  const PopularImageItem({
    Key? key,
    required this.image,
    required this.description,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(ImageDownloadScreen(
        image: image,
        desc: description,
        name: name,
      )),
      child: Material(
        elevation: 20,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: context.height * .25,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.subtitle1!.copyWith(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
