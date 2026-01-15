// import 'package:first_app/pages/home.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscured = true;
  GlobalKey<FormState> keyForm = GlobalKey();
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
      
     ),
     body: Container(
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Form(
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
                labelText: 'Fullname',
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                filled: true,
                fillColor: Colors.grey[800]
              ),
              validator: (value) {
                if(value == null || value.isEmpty) return "Ce champ est requis !";
                if(value.length < 3) return "Votre nom complet doit posséder plus de 3 caractères.";
                return null;
              },
              controller: fullnameController,
            ),
        
            SizedBox(height : 20),
        
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
              validator: (value) {
                if(value == null || value.isEmpty) return "Ce champ est requis !";
                if(value.length < 8) return "Numéro de téléphone ou email invalide.";
                var emailPattern = RegExp(r"^\S+@\S+\.\S+$");
                var phonePattern = RegExp(r"^\+228\d{8}$");
                if(!emailPattern.hasMatch(value) && !phonePattern.hasMatch(value)) {
                  return "Format de l'email ou du téléphone invalide";
                }                
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
                    isObscured ? Icons.visibility_off : 
                    Icons.visibility),),
                suffixIconColor: Colors.white
              ),
              validator: (value) {
                if(value == null || value.isEmpty) return "Ce champ est requis !";
                if(value.length < 8) return "Votre mot de passe doit avoir au moins 8 caractères.";
                return null;
              },
              controller: passwordController,
            ),
            SizedBox(height : 20),
            //Bouton sing in
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                if(keyForm.currentState!.validate()){
                  String fullname = fullnameController.text;
                  String emailOrPhone = emailController.text;
                  String password = passwordController.text;
                  
                }
              }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
              )
            ),
            child: Text('Create account', 
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
                  Navigator.pop(context);
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
                
                child: Text('Sign In', style: 
                TextStyle(fontSize: 18)
                ,)),
            )
          ],
        ),
      ),
     ),
    );
  }
}
