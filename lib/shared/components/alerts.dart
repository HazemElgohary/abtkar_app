import 'package:flutter/material.dart';

import 'package:edge_alerts/edge_alerts.dart';
import 'package:get/route_manager.dart';
import 'package:queen/queen.dart';

abstract class Alert {
  /// * show success alert
  static void success(Object msg, {String desc = ''}) {
    edgeAlert(
      Get.context!,
      title: msg.toString(),
      icon: Icons.check,
      backgroundColor: Get.context!.primaryColor,
      description: desc,
    );
  }

  /// * show error alert
  static void error(Object msg, {String desc = ''}) {
    edgeAlert(
      Get.context!,
      title: msg.toString(),
      icon: Icons.error,
      backgroundColor: const Color(0xFFDC3130),
      description: desc,
    );
  }
}
