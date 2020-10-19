import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection('Users');

  void signUp (String email, String pass, String name, String phone, Function onSuccess) async {

      try {
        final  UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
        print (user.user);
        users.doc(user.user.uid).set({
          'Email:': email,
          'Name': name,
          'Phone': phone
        });
        onSuccess();
        } on FirebaseAuthException catch  (e) {
        if (e.code == 'invalid-email') {
          // Do something :D
        }
      }

  }

}
