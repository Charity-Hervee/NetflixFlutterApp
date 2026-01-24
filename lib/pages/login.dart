
import 'package:first_app/pages/register.dart';
import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  bool isObscured = true;
  GlobalKey<FormState> keyForm = GlobalKey();
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final auth = AuthService();
  Future<void> login() async {
    
    final ok = await auth.login(emailController.text, passwordController.text);
  }

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
     body: 
      Container(
        padding: EdgeInsets.symmetric(horizontal:20),
        child:Form(
          key: keyForm,
          child: Column(
            children: [
              SizedBox(height : 60),
            
              TextFormField(
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
                validator: (value){
                  if (value == null || value.isEmpty) return "Ce champ est requis";
                  if (value.length < 8) return "Votre email ou  numéro de téléphone est invalide";
                  var emailPattern = RegExp(r"^\S+@\S+\.\S+$");
                  var phonePattern = RegExp(r"^\+228\d{8}$");
                  if(!emailPattern.hasMatch(value) && !phonePattern.hasMatch(value)) return "format de l'email ou du numéro est incorrecte";
                  return null;
                },
                controller: emailController,
              ),
              SizedBox(height : 20),
              TextFormField(
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
                          isObscured ? Icons.visibility :
                          Icons.visibility_off),),
                    suffixIconColor: Colors.white
                ),
                validator: (value){
                  if (value == null || value.isEmpty) return "Ce champ est requis";
                  if (value.length < 8) return "Votre password doit contenir minimum 8 caractères";
                  return null;
                },
                controller: passwordController,
              ),
              SizedBox(height : 20),
              //Bouton sing in
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),),
                    child: Text('Create account', style:
                    TextStyle(fontSize: 18)
                      ,)),
              ),


            ],
          ),
          ),
        ),
    );
  }
}
