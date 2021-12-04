import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_netflix_clone/verify.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';
enum verificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,

}

class addnum extends StatefulWidget {

  const addnum({Key? key}) : super(key: key);

  @override
  _addnumState createState() => _addnumState();

}

class _addnumState extends State<addnum> {
  //final currentState = verificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ), ),
      body: Container(
        child:Align(
          alignment: Alignment.centerLeft,


        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 40,bottom: 5),
            alignment: Alignment.topLeft,
            child:Text('Login Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),textAlign: TextAlign.left,),

          ),
          Container(
            margin: EdgeInsets.only(left: 40,bottom: 125),
            alignment: Alignment.topLeft,
            child:Text('Hello,welcome back to your account',style: TextStyle(color: Colors.black,fontSize: 14),),


          ),

          Container(
            width: 320,
            margin: EdgeInsets.only(bottom: 50),
            child:Text('Please enter your mobile number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
            ,
          ),
           Container(
             width: 330,
             decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(6)),
             child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      Flexible(
        flex: 35,
      //fit: FlexFit.loose,
      child: Container(
               child: new Padding(
                 padding: const EdgeInsets.only(left: 0.0),
                 child: CountryCodePicker(alignLeft: true,initialSelection: 'IN',favorite: ['+91','IN'],),
               ),
           )
    ),
    Container(
     // margin: EdgeInsets.only(bottom: 10),
      child:Flexible(
      flex: 65,
    child: new Padding(
    padding: const EdgeInsets.only(right: 0.0),
    child: TextField(
      controller: phoneController,
      decoration: new InputDecoration.collapsed(hintText: 'Phone Number'),

      keyboardType: TextInputType.phone,
    ),
    ),
    ),),
    ],
    ),),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 40,
            width: 240,
            child: ElevatedButton(
            //   onPressed: (){
            // Get.to(verify());
            //   },

                onPressed: () async{
                 Duration timeout;
                 await _auth.verifyPhoneNumber(phoneNumber:"+91"+phoneController.text , verificationCompleted: (phoneAuthCredential) async{

                 }, verificationFailed: (verificationFailed)async{
                   //final snackBar = ScaffoldMessengerState().showSnackBar(SnackBar(content: Text(verificationFailed.message.toString())));



                 }, codeSent: (verificationId,resendingToken) async{
                   Get.to(verify(),arguments: verificationId);
                   this.verificationId = verificationId;

                 }, codeAutoRetrievalTimeout: (verificationId)async{

                 },
                     timeout: timeout = const Duration(seconds:60),);
                  //
                },
                child:Text("Request OTP",style: TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(primary: Colors.blue),) ,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50,top: 10),
            child:Text('You will recieve a 4 digit code to verify.',style: TextStyle(color: Colors.grey,fontSize: 14),),
          )

          ],
      )),)
    );
  }
}
