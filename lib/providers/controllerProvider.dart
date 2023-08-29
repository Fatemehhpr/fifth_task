import 'package:flutter/cupertino.dart';

class controllerProvider extends ChangeNotifier {

  var numberController;


  void setNumberController(TextEditingController controller) {
    numberController = controller;
    notifyListeners();
  }
  
  TextEditingController get getNumberController => numberController;

}