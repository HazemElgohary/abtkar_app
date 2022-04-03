part of 'popular_cubit.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}
class PopularLoading extends PopularState {}
class PopularLoadingMore extends PopularState {
  final List<Results> list;

  PopularLoadingMore(this.list);
}
class PopularEmpty extends PopularState {}
class PopularSuccess extends PopularState {
  final List<Results> list;

  PopularSuccess(this.list);
}
class PopularError extends PopularState {
  final String msg;

  PopularError(this.msg);
}
