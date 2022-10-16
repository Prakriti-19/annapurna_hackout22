import 'dart:core';

class Inventory {
  String capacity;
  double latitude;
  double longitude;
  String veg;
  String userid;
  String date;
  //String url;
  Inventory(
      {
        required this.capacity,
        required this.latitude,
        required this.longitude,
        required this.veg,
        required this.userid,
        required this.date,
      //  required this.url,
      });
}
class donor_profile{
  String uid;
  String email;
  donor_profile({required this.email,required this.uid});
}