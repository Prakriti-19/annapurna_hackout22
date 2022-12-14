import 'package:annapurna/classes/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../classes/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Usser? _userFormFirebaseUser(User? user) {
    return user != null ? Usser(uid: user.uid) : null;
  }
  Stream<Usser?> get user {
    return _auth.authStateChanges().map( _userFormFirebaseUser );
  }

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      FirebaseFirestore.instance.collection("ngo_profile").doc(user?.uid).set({
        "uid": user?.uid,});
      await DatabaseNGO(uid: user!.uid).updateUserData(email, user!.uid);
      return _userFormFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future register2WithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      FirebaseFirestore.instance.collection("donor_profile").doc(user?.uid).set({
        "uid": user?.uid,});
      await DatabaseDonor(uid: user!.uid).updateUserData(email, user!.uid);
      return _userFormFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      return _userFormFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}