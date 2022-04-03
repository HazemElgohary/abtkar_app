import 'package:abtkar_app/models/popular_people.dart';
import 'package:abtkar_app/shared/components/popular_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/popular_people/cubit/popular_cubit.dart';

class PaginatedItemBuilder extends StatelessWidget {
  final List<Results> list;
  final bool isLoadingMore;

  const PaginatedItemBuilder({
    Key? key,
    required this.list,
    this.isLoadingMore = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        final cubit = BlocProvider.of<PopularCubit>(context);
        final item = PopularItem(
          model: list[index],
        );
        final isLastItem = list.length == index + 1;

        if (isLastItem && cubit.canLoadMore && !isLoadingMore) {
          cubit.loadMore();
        }
        if (isLastItem && cubit.canLoadMore && isLoadingMore) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              item,
              const Center(child: CircularProgressIndicator()),
            ],
          );
        } else {
          return item;
        }
      },
    );
    // return ListView.builder(
    //   itemCount: list.length,
    //   itemBuilder: (context, index) {
    //     final item = PopularItem(
    //       model: list[index],
    //     );
    //     final isLastItem = index == list.length - 1;
    //     final showLoadingIndicator = isLastItem && isLoadingMore;
    //
    //     if (showLoadingIndicator) {
    //       if (!isLoadingMore) {
    //         loadMore();
    //       }
    //       return Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           item,
    //           const Center(child: CircularProgressIndicator.adaptive())
    //         ],
    //       );
    //     }
    //     return item;
    //   },
    // );
  }
}
