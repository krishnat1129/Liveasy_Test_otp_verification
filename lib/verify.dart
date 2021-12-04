import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netflix_clone/addnum.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_netflix_clone/selectprofile.dart';
import 'package:get/get.dart';
class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 1 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Replace this with anything you want to put after each 4 numbers
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length)
    );
  }
}

class verify extends StatefulWidget {
  const verify({Key? key}) : super(key: key);

  @override
  _verifyState createState() => _verifyState();
}

class _verifyState extends State<verify> {

  final otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      if(authCredential?.user!=null){
        Get.to(selectpro());
      }
    } on Exception catch (e) {

    }
  }


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
                    child:Text('Verify OTP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),textAlign: TextAlign.left,),

                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,bottom: 100),
                    alignment: Alignment.topLeft,
                    child:Text('You will get an OTP via SMS',style: TextStyle(color: Colors.grey,fontSize: 14),),


                  ),

                  Container(
                    width: 320,
                    margin: EdgeInsets.only(bottom: 70),
                    child:Text('Please enter OTP sent to mobile number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)
                    ,
                  ),
                  Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(bottom: 10),
                          child:Flexible(
                            flex: 65,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: TextField(
                              //   inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly,
                              //   new CustomInputFormatter()
                              // ],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                                controller: otpController,
                                decoration: new InputDecoration.collapsed(hintText: 'Enter OTP'),

                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),)
                        // _textFieldOTP(first: true, last: false),
                        // _textFieldOTP(first: false, last: false),
                        // _textFieldOTP(first: false, last: false),
                        // _textFieldOTP(first: false, last: false),
                        // _textFieldOTP(first: false, last: false),
                        // _textFieldOTP(first: false, last: true),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: 330,
                  //   decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(6)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     //mainAxisSize: MainAxisSize.min,
                  //     children: <Widget>[
                  //       Flexible(
                  //           flex: 35,
                  //           //fit: FlexFit.loose,
                  //           child: Container(
                  //             child: new Padding(
                  //               padding: const EdgeInsets.only(left: 0.0),
                  //               child: CountryCodePicker(alignLeft: true,initialSelection: 'IN',favorite: ['+91','IN'],),
                  //             ),
                  //           )
                  //       ),
                  //       Container(
                  //         // margin: EdgeInsets.only(bottom: 10),
                  //         child:Flexible(
                  //           flex: 65,
                  //           child: new Padding(
                  //             padding: const EdgeInsets.only(right: 0.0),
                  //             child: TextField(
                  //               decoration: new InputDecoration.collapsed(hintText: 'Phone Number'),
                  //
                  //               keyboardType: TextInputType.phone,
                  //             ),
                  //           ),
                  //         ),),
                  //     ],
                  //   ),),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 240,
                    child: ElevatedButton(
                      // onPressed: (){
                      //   Get.to(selectpro());
                      // },

                      onPressed: () async{
                        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: Get.arguments.toString(), smsCode: otpController.text);
                        signInWithPhoneAuthCredential(phoneAuthCredential);

                        // Get.to(verify());
                      },
                      child:Text("Verify",style: TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(primary: Colors.blue),) ,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 50,top: 10),
                    child: RichText(
                       text: TextSpan(
                         text: 'Did not recieve an OTP?',style: TextStyle(fontSize: 14,color: Colors.black),children: [
                           TextSpan(text: ' Resend OTP',recognizer:TapGestureRecognizer()..onTap  = () =>print('click'),style: TextStyle(fontSize: 14,color: Colors.blue))
                       ]
                       ),

                    ),
                    // child:Row(
                    //   children: [
                    //     Flexible(child: Text('Did not Recieve the OTP?',style: TextStyle(color: Colors.grey,fontSize: 14))),
                    //     Flexible(child: RichText('Resend again',style: TextStyle(color: Colors.blue,fontSize: 14)))
                    //   ],
                    // ),
                  )

                ],
              )),)
    );
  }
  _textFieldOTP({required bool first,last}){
    return Container(
      height: 50,
      child: AspectRatio(
        aspectRatio: 0.8,child: TextField(
        autofocus: true,
        onChanged: (value){
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(counter: Offstage(),focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1,),
          borderRadius: BorderRadius.circular(6)
        )),
      ),
      ),
    );
  }


}
