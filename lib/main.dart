import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/addnum.dart';
import 'package:get/get.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = ['English','English(Indian)'];


  String? value;




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
            child: Image.asset('assets/images/7060280_preview.jpg',width: 250,height: 250,fit: BoxFit.cover,)
        ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child:Text('Please select your Language',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),),
            Text('You can change the langugae at any time.',style: TextStyle(color: Colors.grey,fontSize: 14 ),
            ),
            Container(
              height:50,
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              width: 250,
              margin: const EdgeInsets.only(top: 25.0),
              decoration: BoxDecoration(

               borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black,width: 1)
              ),
              child:DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text('Select Language'),
                //decoration: const InputDecoration(border: OutlineInputBorder()),
                itemHeight: 50,

              isExpanded:true,

              value:value,items: items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(()=>this.value = value as String?),


            )),),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 40,
              width: 230,
              child: ElevatedButton(

                  onPressed: () {
                    Get.to(addnum());
                  },
                  child:Text("Next",style: TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(primary: Colors.blue)) ,
            )

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  DropdownMenuItem<String>buildMenuItem(String item) => DropdownMenuItem(value: item,child: Text(item,style: TextStyle(fontSize: 16),),);

}
