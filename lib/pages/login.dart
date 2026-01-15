import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/register.dart';
import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
     appBar: AppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      title: Image(image: 
      AssetImage('assets/images/logo.png'),
       height: 60,) ,
      centerTitle: true,
      actions: [
        const Text('Help', style: TextStyle(
          fontSize: 18
        ),)
      ],
     ),
     body: Container(
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Column(
        children: [
          SizedBox(height : 60),
          TextField(
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none
              ),
              labelText: 'Email or phone number',
              labelStyle: TextStyle(
                color: Colors.white
              ),
              filled: true,
              fillColor: Colors.grey[800]
            ),
          ),
          SizedBox(height : 20),
          TextField(
            obscureText: isObscured,
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none
              ),
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.white
              ),
              filled: true,
              fillColor: Colors.grey[800],
              suffixIcon: IconButton(onPressed: () {
                 setState(() {
                   isObscured = !isObscured;
                 });                 
                 }, 
                 icon: Icon(
                  isObscured ? Icons.visibility_off : 
                  Icons.visibility),),
              suffixIconColor: Colors.white
            ),
          ),
          SizedBox(height : 20),
          //Bouton sing in
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              //Aller vers une autre page 
            Navigator.push(context,
             MaterialPageRoute(builder: (context){
              return Home();
             }));
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)
            )
          ),
          child: Text('Sign In', 
          style: TextStyle(fontSize: 18),),
          ),
          ),
          const SizedBox(height : 20),
          const Text('OR', style: TextStyle(
            color: Colors.white, fontSize: 18 ),),
          const SizedBox(height : 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: (){
                Navigator.push(context,
                 MaterialPageRoute(builder: (context){
                  return RegisterScreen();
             }));
              }, 
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(                
                borderRadius: BorderRadius.circular(6)
              ),
              side: BorderSide(
                width: 2,
                color: Colors.white
              )
              ),
              
              child: Text('Sign Up', style: 
              TextStyle(fontSize: 18)
              ,)),
          )
        ],
      ),
     ),
    );
  }
}
