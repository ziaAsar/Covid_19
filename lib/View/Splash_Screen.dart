import 'dart:async';

import 'package:covid_19/View/World_States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _controller =AnimationController(
    duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    //dispose();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=>WorldStateScreen()))
        // ()=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>WorldStateScreen()),
        //         (route) => false)

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Image(image: AssetImage("Asset/Images/virus.png")
                  ),
                ),
                builder: (BuildContext context,Widget ? child){
                    return Transform.rotate(angle: _controller.value* 2.0 * math.pi,
                      child: child
                    );
                }
            ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                  child: Text("Covid-19\nTracker App",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,
                  ),
              ),
          ],
        ),
      ),
    );
  }
}
