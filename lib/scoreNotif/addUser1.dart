//import 'package:crud_flutter/main.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AddUser1 extends StatefulWidget {
  @override
  _AddUser1State createState() => _AddUser1State();
}

class _AddUser1State extends State<AddUser1> {
  final txtFullName = new TextEditingController();
  final txtEmail = new TextEditingController();
  bool _valName = false;
  bool _valEmail = false;

  _AddUser1State();

  Future _saveDetails(String name, String email) async {
    var url = "https://ssaflutterapp.000webhostapp.com/saveData1.php";
    final response = await http.post(url, body: {"name": name, "email": email});

    var res = response.body;
    if (res == "true") {
      // txtEmail.clear();
      // txtFullName.clear();

      // Navigator.pop(context);
      //  showAboutDialog(context:context,
      //      applicationVersion: '1.0',
      //      applicationIcon:Icon(Icons.landscape) ,
      //      applicationLegalese: "New users details was 'CREATED' successfully if you want to see the changes, just relaunch this application");
    } else {
      print("Error:" + res);
    }
  }

  @override
  void dispose() {
    txtFullName
        .dispose(); //by using this dispose() method it clears that cache unwanted
    txtEmail.dispose(); //when the form is closed it will dispose its contents
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            // actions: [Icon(Icons.person_add)],
            //primary: true,
            title: Text(
              'Add  Details Here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23.5,
                fontFamily: 'IndieFlower',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            backgroundColor: Colors.orangeAccent,

            shadowColor: Colors.black,
            centerTitle: true,
            // backgroundColor: Colors.amber,
          ),

          // appBar: AppBar(
          //   title: Text('Add User Here'),
          // ),

          body: Container(

              //padding: EdgeInsets.all(8.0),
              // padding: EdgeInsets.zero,
              child: Container(
            constraints: BoxConstraints.expand(),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.purpleAccent,
                ],
                begin: Alignment.topRight,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 150.0),
            // padding: EdgeInsets.all(20.0),

            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                color: Colors.green,
              ),

              //child: OtpScreen(),

              // decoration: BoxDecoration(
              // image: DecorationImage(
              // image: NetworkImage("https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
              // fit: BoxFit.cover)
              // )
              // padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: new InputDecoration(
                      hintText: "Enter Team Name/Info",
                      hintStyle: TextStyle(fontSize: 17.0),
                      labelText: "Team Name/Info",
                      labelStyle: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      errorText: _valName ? 'Name Can\'t Be Empty' : null,
                    ),
                    controller: txtFullName,
                  ),
                  TextField(
                    decoration: new InputDecoration(
                      hintText: "Scores/Info",
                      hintStyle: TextStyle(fontSize: 17.0),
                      labelText: "Scores/Info",

                      labelStyle: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      errorText: _valEmail
                          ? 'Scores Can\'t Be Empty'
                          : null, //here can\'t is escape sequence
                    ),
                    controller: txtEmail,
                    //keyboardType: TextInputType.number
                  ),
                  ButtonBar(
                    children: [
                      RaisedButton(
                        color: Colors.black,
                        child: Text('save Details'),
                        onPressed: () {
                          setState(() {
                            txtFullName.text.isEmpty
                                ? _valName = true
                                : _valName = false;
                            txtEmail.text.isEmpty
                                ? _valEmail = true
                                : _valEmail = false;
                            if (_valName == false && _valEmail == false) {
                              _saveDetails(txtFullName.text, txtEmail.text);
                            }
                          });
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                              msg:
                                  "details updated successfully, if u want to see the changes just relaunch this app",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        },
                      ),
                      RaisedButton(
                        color: Colors.red,
                        child: Text('Clear'),
                        onPressed: () {
                          txtFullName.clear();
                          txtEmail.clear();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            // bottomNavigationBar: CurvedNavigationBar(
            //   index: 2,
            //   height: 50.0,
            //
            //   backgroundColor: Colors.blueAccent,
            //
            //   items: [
            //
            //     Icon(Icons.search, size: 25),
            //     Icon(Icons.home, size: 25),
            //     Icon(Icons.add, size: 25,),
            //
            //
            //
            //   ],
            //   onTap: (int index){
            //     print(index.toString());
            //     if(index==2){
            //       Navigator.push(context,MaterialPageRoute(
            //           builder:(context) =>AddUser1()));
            //     }else if(index==1){
            //       //Navigator.pop(context);
            //       Navigator.pop(context,MaterialPageRoute(
            //           builder:(context) =>MyApp()));
            //     }
            //     // currentIndex=index;
            //   },
            // ),
          ))),
    );
  }
}

// //import 'package:crud_flutter/main.dart';
// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// //import 'dart:html';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class AddUser1 extends StatefulWidget {
//   @override
//   _AddUser1State createState() => _AddUser1State();
// }

// class _AddUser1State extends State<AddUser1> {
//   final txtFullName = new TextEditingController();
//   final txtEmail = new TextEditingController();
//   bool _valName = false;
//   bool _valEmail = false;

//   _AddUser1State();

//   Future _saveDetails(String name, String email) async {
//     var url = "https://ssaflutterapp.000webhostapp.com/saveData1.php";
//     final response = await http.post(url, body: {"name": name, "email": email});

//     var res = response.body;
//     if (res == "true") {
//       // txtEmail.clear();
//       // txtFullName.clear();

//       // Navigator.pop(context);
//       //  showAboutDialog(context:context,
//       //      applicationVersion: '1.0',
//       //      applicationIcon:Icon(Icons.landscape) ,
//       //      applicationLegalese: "New users details was 'CREATED' successfully if you want to see the changes, just relaunch this application");
//     } else {
//       print("Error:" + res);
//     }
//   }

//   @override
//   void dispose() {
//     txtFullName
//         .dispose(); //by using this dispose() method it clears that cache unwanted
//     txtEmail.dispose(); //when the form is closed it will dispose its contents
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       // maintainBottomViewPadding: true,
//       child: Scaffold(
//           resizeToAvoidBottomPadding: false,
//           appBar: AppBar(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(30),
//               ),
//             ),
//             // actions: [Icon(Icons.person_add)],
//             //primary: true,
//             title: Text(
//               'Add  Details Here',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 23.5,
//                 fontWeight: FontWeight.bold,
//                 fontStyle: FontStyle.italic,
//               ),
//             ),
//             backgroundColor: Colors.orangeAccent,

//             shadowColor: Colors.black,
//             centerTitle: true,
//             // backgroundColor: Colors.amber,
//           ),
//           // extendBody: false,
//           // extendBodyBehindAppBar: true,
//           // // appBar: AppBar(
//           // //   title: Text('Add User Here'),
//           // // ),
//           resizeToAvoidBottomInset: false,
//           body: SingleChildScrollView(
//             child: Container(
//               constraints: BoxConstraints.expand(),

//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.deepPurpleAccent,
//                     Colors.purpleAccent,
//                   ],
//                   begin: Alignment.topRight,
//                 ),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 150.0),
//               child: Container(
//                 padding: const EdgeInsets.all(20.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(80.0),
//                   color: Colors.green,
//                 ),
//                 //child: OtpScreen(),

//                 // decoration: BoxDecoration(
//                 // image: DecorationImage(
//                 // image: NetworkImage("https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
//                 // fit: BoxFit.cover)
//                 // ),
//                 // padding: EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextField(
//                       decoration: new InputDecoration(
//                         hintText: "Enter Team Name/Info",
//                         hintStyle: TextStyle(fontSize: 17.0),
//                         labelText: "Team Name/Info",
//                         labelStyle: TextStyle(
//                             fontSize: 20.0, fontWeight: FontWeight.bold),
//                         errorText: _valName ? 'Name Can\'t Be Empty' : null,
//                       ),
//                       controller: txtFullName,
//                     ),
//                     TextField(
//                       decoration: new InputDecoration(
//                         hintText: "Scores/Info",
//                         hintStyle: TextStyle(fontSize: 17.0),
//                         labelText: "Scores/Info",

//                         labelStyle: TextStyle(
//                             fontSize: 20.0, fontWeight: FontWeight.bold),
//                         errorText: _valEmail
//                             ? 'Scores Can\'t Be Empty'
//                             : null, //here can\'t is escape sequence
//                       ),
//                       controller: txtEmail,
//                       //keyboardType: TextInputType.number
//                     ),
//                     ButtonBar(
//                       children: [
//                         RaisedButton(
//                           color: Colors.black,
//                           child: Text('save Details'),
//                           onPressed: () {
//                             setState(() {
//                               txtFullName.text.isEmpty
//                                   ? _valName = true
//                                   : _valName = false;
//                               txtEmail.text.isEmpty
//                                   ? _valEmail = true
//                                   : _valEmail = false;
//                               if (_valName == false && _valEmail == false) {
//                                 _saveDetails(txtFullName.text, txtEmail.text);
//                               }
//                             });
//                             Navigator.pop(context);
//                             Fluttertoast.showToast(
//                                 msg:
//                                     "details updated successfully, if u want to see the changes just relaunch this app",
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.BOTTOM,
//                                 timeInSecForIosWeb: 1,
//                                 backgroundColor: Colors.white,
//                                 textColor: Colors.black,
//                                 fontSize: 16.0);
//                           },
//                         ),
//                         RaisedButton(
//                           color: Colors.red,
//                           child: Text('Clear'),
//                           onPressed: () {
//                             txtFullName.clear();
//                             txtEmail.clear();
//                           },
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               // bottomNavigationBar: CurvedNavigationBar(
//               //   index: 2,
//               //   height: 50.0,
//               //
//               //   backgroundColor: Colors.blueAccent,
//               //
//               //   items: [
//               //
//               //     Icon(Icons.search, size: 25),
//               //     Icon(Icons.home, size: 25),
//               //     Icon(Icons.add, size: 25,),
//               //
//               //
//               //
//               //   ],
//               //   onTap: (int index){
//               //     print(index.toString());
//               //     if(index==2){
//               //       Navigator.push(context,MaterialPageRoute(
//               //           builder:(context) =>AddUser1()));
//               //     }else if(index==1){
//               //       //Navigator.pop(context);
//               //       Navigator.pop(context,MaterialPageRoute(
//               //           builder:(context) =>MyApp()));
//               //     }
//               //     // currentIndex=index;
//               //   },
//               // ),
//             ),
//           )),
//     );
//   }
// }
