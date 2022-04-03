import 'package:queen/queen.dart';
import 'package:abtkar_app/generated/tr.dart';
import 'package:abtkar_app/models/popular_people.dart';
import 'package:abtkar_app/shared/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Results model;

  const DetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: model.name),
      body: model.knowFor.isNotEmpty ?GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        childAspectRatio: .8,
        children: model.knowFor
            .map(
              (e) => e.backdropImage.isNotEmpty
                  ? Material(
                elevation: 20,
                  borderRadius: const BorderRadius.all(Radius.circular(8),),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(e.getBackdropImage),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.overview,maxLines: 6,overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                    )
                  : Material(
                elevation: 10,
                borderRadius: const BorderRadius.all(Radius.circular(8),),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(e.getPosterImage),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.overview,maxLines: 6,overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ):Center(child: Text(Tr.empty.tr),),
    );
  }
}
