import 'package:first_app/pages/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    Future.delayed(Duration(seconds: 2), (){
      if(!mounted){
        return;
      }
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginApp()),(Route)=>false);
    });
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      body:
          Center(
            child: Image(image: AssetImage('assets/images/logo.png'), width: MediaQuery.sizeOf(context).width/2,),
          )
    );
  }
}