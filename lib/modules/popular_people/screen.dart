import 'package:abtkar_app/generated/tr.dart';
import 'package:abtkar_app/modules/popular_people/cubit/popular_cubit.dart';
import 'package:abtkar_app/shared/components/custom_app_bar.dart';
import 'package:abtkar_app/shared/components/paginated_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/queen.dart';

import '../../shared/components/popular_item.dart';

class PopularPeopleScreen extends StatelessWidget {
  const PopularPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Tr.popularPeople.tr),
      body: BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PopularLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is PopularSuccess) {
            final cubit = BlocProvider.of<PopularCubit>(context);
            return RefreshIndicator(
              onRefresh: cubit.refresh,
              child: PaginatedItemBuilder(list: state.list,),
            );
          }
          if (state is PopularLoadingMore) {
            final cubit = BlocProvider.of<PopularCubit>(context);
            return RefreshIndicator(
              onRefresh: cubit.refresh,
              child: PaginatedItemBuilder(
                list: state.list,
                isLoadingMore: true,
              ),
            );
          }
          if (state is PopularError) {
            final cubit = BlocProvider.of<PopularCubit>(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.msg),
                Container(
                  color: Colors.amber,
                  child: MaterialButton(
                    onPressed: cubit.refresh,
                    child: Text(Tr.refresh.tr),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
