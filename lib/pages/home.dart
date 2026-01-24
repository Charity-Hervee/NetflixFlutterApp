import 'package:first_app/pages/login.dart';
import 'package:first_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = "";
  final storage = const FlutterSecureStorage();
  final auth = AuthService();

  @override
  void initState() {
    super.initState();
    initName();
  }

  Future<void> initName() async {
    final user = await storage.read(key : "email");
    setState(() {
      email = user!;
    });
    
  }

  Future<void> deconexion() async {
    await auth.logout(email);
    if(mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginApp()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body : Column(
        children: [
          Text(email, style: TextStyle(color: Colors.black),),
          Center(child: 
            ElevatedButton(onPressed: (){
              deconexion();
            }, 
            child: Text('Déconnecter'))
          ,),
        
        ],
      )
    );
  }
}