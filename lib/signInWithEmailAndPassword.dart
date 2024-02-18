 
 
 
 
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error Logning in : $e');
    }
  }