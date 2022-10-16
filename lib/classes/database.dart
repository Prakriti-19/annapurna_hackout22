import 'package:cloud_firestore/cloud_firestore.dart';
String mail='';
class DatabaseDonor {
  final String uid;

  DatabaseDonor({required this.uid});

  final CollectionReference profileCollection =
  FirebaseFirestore.instance.collection('donor_profile');

  Future<void> updateUserData(String email,String uid) async {
    print("result1$email");mail=email;
    return await profileCollection.doc(uid).set({
      'email': email,
      'uid': uid,
  });
  }
}

class DatabaseNGO{
  final String uid;

  DatabaseNGO({required this.uid});

  final CollectionReference profile =
  FirebaseFirestore.instance.collection('ngo_profile');

  Future<void> updateUserData(String email,String uid) async {
    mail=email;
    return await profile.doc(uid).set({
      'email': email,
      'uid': uid,
    });
  }
}
class inventory{
  final String uid;
  inventory({required this.uid});
  Future<void> updateUserData(String capacity, String veg, double latitude, double longitude, String date) async {
    DocumentReference productCollection =
    FirebaseFirestore.instance.collection('Inventory').doc();
    productCollection.set({
      'capacity': capacity,
      'latitude': latitude,
      'longitude': longitude,
      'email':mail,
      'veg': veg,
      'userid': productCollection.id,
      'date': date,
      'productid':"",
    });
  }
}