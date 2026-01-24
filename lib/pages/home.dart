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
              Navigator.pop(context);
            }, 
            child: Text('Retour en arrière'))
          ,),
        ],
      )
    );
  }
}