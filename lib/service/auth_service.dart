import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {

  final storage = const FlutterSecureStorage();
  Future<bool> register(String email, String password) async{
    final existing  =  await storage.read(key: email);
    if(existing != null) return false;// Cas ou l'email existe
    await storage.write(key: email, value: password) ;
    return true ;
  }
  Future<String?> login (String email, String password) async {
    final stored =  await storage.read(key: email);
    if(stored != null && stored == password ) {
      await storage.write(key: "token", value: "fake_token") ;
      await storage.write(key: "email", value: email) ;
      return "fake_token";
    }
     return null;
    }
  Future<void> logout (String email, String password) async {
      await storage.delete(key: "token") ;
      await storage.delete(key: email) ;
    }

}