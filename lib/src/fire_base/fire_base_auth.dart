import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection('Users');

  void signUp (String email, String pass, String name, String phone, Function onSuccess, Function(String) onRegisterError) async {

      try {
        final  UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
        print (user.user);
        users.doc(user.user.uid).set({
          'Email:': email,
          'Name': name,
          'Phone': phone
        });
        onSuccess();
        } on FirebaseAuthException catch  (error) {
          _onSignUpErr(error.code, onRegisterError);
      }
  }

  void _onSignUpErr (String code, Function(String) onRegisterError ) {
    switch (code) {

      case "invalid-email":
        onRegisterError("Invalid email");
        break;
      case "email-already-in-use" :
        onRegisterError("Email has existed");
        break;
      case "weak-password" :
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("Sign up failed, please try again");
        break;
    }
  }


}
