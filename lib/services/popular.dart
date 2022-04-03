import 'package:abtkar_app/generated/tr.dart';
import 'package:abtkar_app/helpers/api_client.dart';
import 'package:abtkar_app/helpers/end_points.dart';
import 'package:abtkar_app/models/popular_people.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:queen/queen.dart';

class PopularPeopleService {
  Future<List<Results>> findManyPaginated({
    int page = 1,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
    connectivityResult == ConnectivityResult.ethernet
    ) {
      final res = await Api.get(
        EndPoints.popularPeople,
        query: {
          'page': page,
        },
      );
      if (res.statusCode != 200) {
        throw res.data['status_message'] ?? res.data;
      }
      return (res.data['results'] as List)
          .map(
            (e) => Results.fromJson(e),
          )
          .toList();
    }
    else{
      throw Tr.youAreNotConnected.tr;
    }
  }
}
