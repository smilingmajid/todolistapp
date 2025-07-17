
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class ADrawerController extends GetxController{


  final AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();

  void showDrawer() => advancedDrawerController.showDrawer();

  void hideDrawer() => advancedDrawerController.hideDrawer();

  

}