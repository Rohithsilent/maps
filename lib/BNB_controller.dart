import 'package:get/get.dart';
import 'package:maps/converter.dart';
import 'mapPage.dart';

class bnbController extends GetxController{
  RxInt index = 0.obs;

  var pages =[
    MapPage(),
    converter()
  ];
}