// import 'dart:convert';
// import 'package:crud_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/admin panel/AdminLogin.dart';
// import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// import 'admin panel/homePageUser.dart';
import 'homePage.dart';

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

//void main() => runApp(new MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          body: Container(
            //color: Colors.deepPurpleAccent,

            //###################################
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.purpleAccent,
                ],
                begin: Alignment.topRight,
              ),
            ),
            //###################################
            child: OtpScreen(),
          )),
    );
  }
}

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List currentpin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.0),
    borderSide: BorderSide(color: Colors.transparent),
  );
  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildExitButton(),
          Expanded(
              child: Container(
            alignment: Alignment(0, 0.5),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        // padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.transparent),
                        child: Text(
                          "Welcome To Our Smashers Sports Academy.",
                          style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'IndieFlower',
                              fontStyle: FontStyle.italic,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // buildSecurityText(),
                    SizedBox(
                      height: 20.0,
                    ),
                    buildPinRow(),
                  ],
                ),
              ),
            ),
          )),
          buildNumberPad(),
        ],
      ),
    );
  }

  buildNumberPad() {
    return Expanded(
        child: SingleChildScrollView(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  keyBoardNumber(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup("1");
                    },
                  ),
                  keyBoardNumber(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup("2");
                    },
                  ),
                  keyBoardNumber(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup("3");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  keyBoardNumber(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup("4");
                    },
                  ),
                  keyBoardNumber(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup("5");
                    },
                  ),
                  keyBoardNumber(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup("6");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  keyBoardNumber(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup("7");
                    },
                  ),
                  keyBoardNumber(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup("8");
                    },
                  ),
                  keyBoardNumber(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup("9");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminLogin()));

                        // if (pinOneController == "1" &&
                        //     pinTwoController == "2" &&
                        //     pinThreeController == "3" &&
                        //     pinFourController == "4") {

                        // if (pinIndex == "1" &&
                        //     pinIndex == "2" &&
                        //     pinIndex == "3" &&
                        //     pinIndex == "4") {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => homepage()),
                        //   );
                        // } else
                        //   print("Enter correct password");
                      },
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Icon(Icons.person),
                      // color: Colors.transparent
                      // child: Image.asset(
                      //   "image/delete.png",
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                  keyBoardNumber(
                    n: 0,
                    onPressed: () {
                      pinIndexSetup("0");
                    },
                  ),
                  Container(
                    width: 60.0,
                    child: MaterialButton(
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      onPressed: () {
                        clearPin();
                      },
                      child: Icon(Icons.clear),
                      // child: Image.asset(
                      //   "image/delete.png",
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Contact your Admin about this security PIN",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  },
                  child: Text("Forget PIN ?",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  color: Colors.transparent),
            ],
          ),
        ),
      ),
    ));
  }

  clearPin() {
    if (pinIndex == 0)
      pinIndex = 0;
    else if (pinIndex == 3) {
      setPin(pinIndex, "");
      currentpin[pinIndex - 1] == "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentpin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0)
      pinIndex = 1;
    else if (pinIndex < 4) pinIndex++;
    setPin(pinIndex, text);
    currentpin[pinIndex - 1] = text;
    String strPin = "";
    currentpin.forEach((e) {
      strPin += e;
    });

    //HERE WE CAN CHANGE THE PASSWORD FOR THE APP
    if (strPin ==
        "1"
            "2"
            "3"
            "4") //strPin == "1" && strPin == "2" && strPin == "3" && strPin == "4"
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyAppss()),
      );
    // else {
    //   Fluttertoast.showToast(
    //       msg: "Please Enter Correct PIN", toastLength: Toast.LENGTH_SHORT);
    // }

    //print(strPin);
    // if (currentpin == "1" "2" "3" "4") {
    //   Navigator.pushNamed(context, '/homepage');
    // }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text.toString();
        break;
      case 2:
        pinTwoController.text = text.toString();
        break;
      case 3:
        pinThreeController.text = text.toString();
        break;
      case 4:
        pinFourController.text = text.toString();
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        ),
      ],
    );
  }

  buildSecurityText() {
    return Text(
      "Security Pin",
      style: TextStyle(
          color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.bold),
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
              onPressed: () {},
              height: 50.0,
              minWidth: 50.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "click back navigation bar to exit",
                      //"details updated successfully, if u want to see the changes just relaunch this app",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  // _saveDetails(txtFullName.text,txtEmail.text);

                  // Navigator.pop(context);
                },
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  PINNumber({this.textEditingController, this.outlineInputBorder});
  final OutlineInputBorder outlineInputBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.white30),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class keyBoardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  const keyBoardNumber({Key key, this.n, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purpleAccent.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          "*",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24 * MediaQuery.of(context).textScaleFactor,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// class homepage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("Welcome"),
//     );
//   }
// }

// now we will setup php and database
//thank you

//MY CODES

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:rflutter_alert/rflutter_alert.dart';
// import 'homePage.dart';

//

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool val = true;
//   final formKey = GlobalKey<FormState>();
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       body: new Container(
//         padding: EdgeInsets.all(40.0),
//         width: double.infinity,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 stops: [
//               0.1,
//               0.4,
//               0.7,
//               0.9,
//             ],
//                 colors: [
//               Colors.blue[600],
//               Colors.blue[500],
//               Colors.blue[300],
//               Colors.blue[200],
//             ])),
//         child: Center(
//           child: new ListView(
//             //list view is used for scrolling purpose
//             shrinkWrap: true,
//             children: [
//               //   Image.asset(
//               //   "assets/shuttlecock.jpg",
//               //   height: 100.0,
//               // ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Center(
//                 child: Container(
//                   child: Text(
//                     'LOGIN',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40.0,
//               ),

//               Container(
//                 // padding: EdgeInsets.all(5),
//                 // decoration: BoxDecoration(
//                 //     color: Colors.white,
//                 //     borderRadius: BorderRadius.circular(10),
//                 //     boxShadow: [
//                 //       BoxShadow(
//                 //           color: Color.fromRGBO(143, 148, 251, 2),
//                 //           blurRadius: 20.0,
//                 //           offset: Offset(0,10)
//                 //       )
//                 //     ]
//                 //
//                 // ),

//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         validator: (value) {
//                           if (value == "admin") {
//                             return null;
//                           } else {
//                             return "enter correct details";
//                           }
//                           // isvalid=="surya";
// //                if(value=="surya"){
// // return ;
// //                }else if(value.length>8){
// //                  return "username should not exceed 8 characters";
// //                }
//                         },
//                         decoration: InputDecoration(
//                           icon: Icon(
//                             Icons.account_circle,
//                             color: Colors.white,
//                           ),
//                           hintText: "username",
//                           hintStyle: TextStyle(color: Colors.white70),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30.0,
//                       ),
//                       TextFormField(
//                         obscureText: true,
//                         validator: (value) {
//                           // isvalid=="1234567";
//                           if (value == "password") {
//                             return null;
//                           } else {
//                             return "enter valid password";
//                           }
//                         },
//                         //   if(value=="123456"){
//                         //     //return "please enter valid password";
//                         //   }
//                         // },
//                         decoration: InputDecoration(
//                           icon: Icon(
//                             Icons.lock,
//                             color: Colors.white,
//                           ),
//                           hintText: "password",
//                           hintStyle: TextStyle(color: Colors.white70),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               SizedBox(
//                 height: 30.0,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         stops: [
//                       0.1,
//                       0.4,
//                       0.7,
//                       0.9,
//                     ],
//                         colors: [
//                       Colors.purple[700],
//                       Colors.purple[500],
//                       Colors.purple[500],
//                       Colors.purple[600],
//                     ])),
//                 child: ButtonTheme(
//                   buttonColor: Colors.white10,
//                   height: 50.0,
//                   minWidth: double.infinity,
//                   child: RaisedButton(
//                     onPressed: () {
//                       if (formKey.currentState.validate()) {
//                         // scaffoldKey.currentState.showSnackBar(SnackBar(
//                         //   content: Text("Login is successful"),
//                         // ));

//                         // SnackBar mysnackbar=SnackBar(content: Text("Login Successfully"),);
//                         // Scaffold.of(context).showSnackBar(mysnackbar);
//                         //Navigation Method Best

//                         Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) => MyAppss()));
//                         // CupertinoAlertDialog(
//                         //   title: Text('sTAtus'),
//                         //   content: Text("Successfully logged In"),
//                         // );

//                         //CORRECT METHOD OF ALERT MESSAGE

//                         // return Alert(context:context,title: "Good to see you",
//                         //     desc: "this is description",
//                         //     buttons: [
//                         //       DialogButton(
//                         //         child: Text("ok"),
//                         //         onPressed: (){
//                         //           Navigator.pop(context);
//                         //         },
//                         //       )
//                         //     ]).show();

//                         // AlertDialog(
//                         //   title: Text('Accept'),
//                         // );

//                       } else {
//                         scaffoldKey.currentState.showSnackBar(SnackBar(
//                           content: Text("Login is failed"),
//                         ));
//                       }
//                     },
//                     child: Text("LOGIN", style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Text(
//                 "Forget password?",
//                 style: TextStyle(
//                     color: Colors.white, decoration: TextDecoration.underline),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Center(
//                 child: Container(
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           stops: [
//                             0.1,
//                             0.4,
//                             0.7,
//                             0.9,
//                           ],
//                           colors: [
//                             Colors.purple[700],
//                             Colors.purple[500],
//                             Colors.purple[500],
//                             Colors.purple[600],
//                           ])),
//                   child: Text("User Visit",
//                       style: TextStyle(color: Colors.white, fontSize: 35)),
//                 ),
//               )
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     Image.asset("assets/google.jpg",
//               //       height: 30.0,
//               //      ),
//               //     SizedBox(
//               //       width: 20.0,
//               //     ),
//               //     Image.asset("assets/twitter.jpg",
//               //       height: 30.0,
//               //       ),
//               //   ],
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //EXAMPLE PAGE ROUTE PART

// // class FirstPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Container(
// //         child: Text('Center',style: TextStyle(
// //             fontSize: 70.0
// //         ),),
// //       ),
// //     );
// //   }
// // }
