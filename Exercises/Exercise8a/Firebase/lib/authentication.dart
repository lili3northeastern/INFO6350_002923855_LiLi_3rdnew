// authentication.dart

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHelper {

Future<void> registerWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print('Error during registration: $e');
  }
}


 Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print('Error during login: $e');
  }
}


 Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print('Error during sign out: $e');
  }
}


   User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}

}
