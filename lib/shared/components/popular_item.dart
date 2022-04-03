import 'package:abtkar_app/modules/details/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queen/queen.dart';
import '../../models/popular_people.dart';

class PopularItem extends StatelessWidget {
  final Results model;

  const PopularItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * .02, vertical: context.height * .01),
      child: Card(
        elevation: 10,
        child: ListTile(
          onTap: ()=>Get.to(DetailsScreen(model: model,)),
          leading: model.profileImage.isNotEmpty
              ? Image.network(model.getProfileImage)
              : Image.asset(model.getProfileImage),
          title: Text(model.name),
          subtitle: Text(model.department),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(model.popularity.toStringAsFixed(2)),
              const Icon(Icons.star,color: Colors.amber,),
            ],
          ),
        ),
      ),
    );
  }
}
