import 'dart:typed_data';

import 'package:abtkar_app/helpers/api_client.dart';

class ImageServices {
  Future<Uint8List> getImage(String image) async {
    final res = await Api.get(
      image,
      wantBytes: true,
    );
    return Uint8List.fromList(res.data);
  }
}
