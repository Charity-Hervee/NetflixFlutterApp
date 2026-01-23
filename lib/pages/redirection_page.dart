// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/login.dart';

class RedirectionPage extends StatefulWidget {
  const RedirectionPage({super.key});
  @override
  State<RedirectionPage> createState() => _RedirectionPageState();
}

class _RedirectionPageState extends State<RedirectionPage> {
  final storage = const FlutterSecureStorage();
  bool loading  = true;
  bool logged = false;
  Future<void> checkSection() async {
    final token = storage.read(key:"Token");
    setState(() {
      logged = token == token;
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(loading ){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return logged ? Home() : LoginApp();

  }
}