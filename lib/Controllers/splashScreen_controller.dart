import 'dart:async';
import 'package:get/get.dart';
import '../View/World_States.dart';
class SplashScreenController extends GetxController{
  // void dispose(){
  //   _controller.dispose();
  //   super.dispose();
  // }
  void onInit() {
    // TODO: implement initState
    super.onInit();
    //dispose();
    Timer(Duration(seconds: 4),
            ()=>Get.to(WorldStateScreen())
      // ()=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>WorldStateScreen()),
      //         (route) => false)

    );
  }
  // @override
  // void onInit() {
  //   super.onInit();
  //   Future.delayed(Duration(seconds: 4), () {
  //     Get.off(() => WorldStateScreen()); // or Get.toReplacement if needed
  //   });
  // }
}