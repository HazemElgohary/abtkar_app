import 'dart:developer';

import 'package:abtkar_app/services/popular.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:queen/locators.dart';

import '../../../models/popular_people.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial()) {
    refresh();
  }

  final services = Locators.find<PopularPeopleService>();

  final people = <Results>[];

  int _pageNo = 0;
  bool _canLoadMore = true;
  bool get canLoadMore => _canLoadMore;

  Future<void> refresh() async {
    log('refresh()');
    _pageNo = 0;
    _canLoadMore = true;
    people.clear();
    loadMore();
  }

  Future<void> loadMore() async {
    if (!_canLoadMore) return;
    try{
      emit(_pageNo == 0 ? PopularLoading() : PopularLoadingMore(people));
      final _lastRes = await services.findManyPaginated(page: ++_pageNo,);

      if (_lastRes.isEmpty) {
        _canLoadMore = false;
        emit(PopularEmpty());
      }
        people.addAll(_lastRes);
        emit(PopularSuccess(people));
    }catch(e,st){
      log(e.toString());
      log(st.toString());
      emit(PopularError(e.toString()));
    }
  }
}
