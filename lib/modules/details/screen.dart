import 'package:queen/queen.dart';
import 'package:abtkar_app/generated/tr.dart';
import 'package:abtkar_app/models/popular_people.dart';
import 'package:abtkar_app/shared/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/components/popular_image_item.dart';

class DetailsScreen extends StatelessWidget {
  final Results model;

  const DetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: model.name),
      body: model.knowFor.isNotEmpty
          ? GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8),
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: .5,
              children: model.knowFor
                  .map((e) => e.backdropImage.isNotEmpty
                      ? PopularImageItem(
                          image: e.getBackdropImage,
                          description: e.overview,
                          name: e.title ?? e.originalName ?? '',
                        )
                      : PopularImageItem(
                          image: e.getPosterImage,
                          description: e.overview,
                          name: e.title ?? e.originalName ?? '',
                        ))
                  .toList(),
            )
          : Center(
              child: Text(Tr.empty.tr),
            ),
    );
  }
}
