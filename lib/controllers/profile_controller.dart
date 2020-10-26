import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/user.dart';

class ProfileController extends GetxController {
  User _user;
  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    //  print('Get Arguments ${Get.arguments}');
    this._user = Get.arguments as User;
  }

  void onInputTextChanged(String text) {
    this._inputText = text;
  }

  void goTobackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      Get.dialog(
        AlertDialog(
          title: Text('ERROR'),
          content: Text('Ingrese un valor valido'),
        ),
      );
    }
  }
}
