import 'package:annapurna/Screens/mail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../classes/profile.dart';

class Item extends StatefulWidget {
  final Inventory profile;
  Item({required this.profile,});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    Inventory profile = widget.profile;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(0xFF, 0x98, 0x31, 0x6A),width: 3),
              color: Colors.white,
               borderRadius: BorderRadius.circular(22)
            ),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.purpleAccent),

                  ),
                  child:Image.network(profile.url,fit: BoxFit.cover,),
                ),
                SizedBox(height: 30,),
                Text( 'Capacity : ${profile.capacity}',style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.w500,
                  color: Color.fromARGB(0xFF, 0x98, 0x31, 0x6A)
                ),),
                SizedBox(height: 30,),
                Text('Food Type: ${profile.veg}',style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w500,
                  color: Color.fromARGB(0xFF, 0x98, 0x31, 0x6A)
                ),),
                SizedBox(height: 30,),
                Text('Date : ${profile.date}',style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w500,
                  color: Color.fromARGB(0xFF, 0x98, 0x31, 0x6A)
                ),),
                SizedBox(height: 10,),
                // Divider(color: Color.fromARGB(0xFF, 0x98, 0x31, 0x6A),thickness: 2,),
                SizedBox(height: 40,),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)
                        )),
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(0xFF, 0x98, 0x31, 0x6A))
                    ),
                    onPressed: ()=> print("YES"),/* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => mail(profile: profile,))) , */ child: Text("Connect",style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
