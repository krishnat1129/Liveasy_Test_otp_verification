import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class selectpro extends StatefulWidget {
  const selectpro({Key? key}) : super(key: key);

  @override
  _selectproState createState() => _selectproState();
}

class _selectproState extends State<selectpro> {
  int radioselected =-1;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async => false,
    child: Scaffold(
      appBar: AppBar( leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),actions: const [ IconButton(onPressed: null, icon: Icon(Icons.logout,color: Colors.white))
      ],

      ),
      body: Center(

        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container( margin: EdgeInsets.only(top: 120,bottom: 5),
              child: Text('Please select your profile',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),),
            Container( margin: EdgeInsets.only(top: 20,bottom: 10),
              width: 360,
              height: 80,
              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1)),

              child: Row(
                children: [
                  Flexible(
                      flex:15,
                      child: Radio(
                        toggleable: true, value: 1, groupValue: radioselected,
                        activeColor: Colors.blue,onChanged: (value) {
                        setState(() {
                          radioselected = value.hashCode;
                        });
                      }
                        ,
                      )),
                  Flexible(
                      flex: 20,child: Icon(Icons.house_siding_outlined,color: Colors.black,)),
                  Flexible(
                      flex: 65,child:Column( crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10,left: 15),
                          child:Text('Shipper',style: TextStyle(fontSize: 16),textAlign: TextAlign.left)),
                      Container(margin: EdgeInsets.only(top: 5,left: 16),child:Text('Every sentence that has been written,no one notices this.',style: TextStyle(fontSize: 10,)))
                    ],))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 20),
              width: 360,
              height: 80,
              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1)),


              child: Row(
                children: [
                  Flexible(flex: 15,child: Radio(
                    toggleable: true, value: 2, groupValue: radioselected,
                    activeColor: Colors.blue,onChanged: (value) {
                    setState(() {
                      radioselected = value.hashCode;
                    });
                  }
                    ,
                  )),
                  Flexible(flex:20,child: Icon(Icons.local_shipping_outlined,color: Colors.black,)),
                  Flexible(flex: 65,child:Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 15),child:Text('Transporter',style: TextStyle(fontSize: 16),textAlign: TextAlign.left),),
                    Container(margin: EdgeInsets.only(top: 5,left: 18),child:Text('Every sentence that has been written,no one notices this.',style: TextStyle(fontSize: 10),)),
                  ],))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 40,
              width: 240,
              child: ElevatedButton(

                onPressed: () {


                },
                child:Text("Verify",style: TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(primary: Colors.blue),) ,
            ),],

        ),

      ),
    ));
  }
}
