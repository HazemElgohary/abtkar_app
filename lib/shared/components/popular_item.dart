import 'package:abtkar_app/helpers/end_points.dart';
import 'package:flutter/material.dart';
import 'package:queen/queen.dart';
import '../../models/popular_people.dart';

class PopularItem extends StatelessWidget {
  final Results model;
  const PopularItem({Key? key,required this.model,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * .02,vertical: context.height * .01),
      child: Card(
        elevation: 10,
        child: ListTile(

          leading: model.profileImage.isNotEmpty ?Image.network(EndPoints.imageUrl + model.profileImage):null,
          title: Text(model.name),
          subtitle: Text(model.department),
          trailing: Text(model.popularity.toStringAsFixed(2)),
        ),
      ),
    );
  }
}
