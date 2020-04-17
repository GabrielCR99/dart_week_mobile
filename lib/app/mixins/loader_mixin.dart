import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class LoaderMixin {
  showLoader() {
    Get.dialog(Container(
      width: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator()],
      ),
    ));
  }

  hiderLoader() {
    Get.back();
  }
}
