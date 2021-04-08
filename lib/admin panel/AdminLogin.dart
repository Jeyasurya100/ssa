import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:crud_flutter/admin panel/homePageUser.dart';

void main() => runApp(
    new MaterialApp(debugShowCheckedModeBanner: false, home: new AdminLogin()));

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool val = true;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: new Container(
        padding: EdgeInsets.all(40.0),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.1,
              0.4,
              0.7,
              0.9,
            ],
                colors: [
              Colors.blue[600],
              Colors.purple[500],
              Colors.blue[300],
              Colors.pink[200],
            ])),
        child: Center(
          child: new ListView(
            //list view is used for scrolling purpose
            shrinkWrap: true,
            children: [
              // Image.asset(
              //   "assets/loginicon.png",
              //   height: 65.0,
              // ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                  child: Text(
                "Admin Panel",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower'),
              )),
              SizedBox(
                height: 30.0,
              ),

              Container(
                // padding: EdgeInsets.all(5),
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //     boxShadow: [
                //       BoxShadow(
                //           color: Color.fromRGBO(143, 148, 251, 2),
                //           blurRadius: 20.0,
                //           offset: Offset(0,10)
                //       )
                //     ]
                //
                // ),

                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == "admin") {
                            return null;
                          } else {
                            return "enter correct details";
                          }
                          // isvalid=="surya";
//                if(value=="surya"){
// return ;
//                }else if(value.length>8){
//                  return "username should not exceed 8 characters";
//                }
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          hintText: "username ",
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          // isvalid=="1234567";
                          if (value == "password") {
                            return null;
                          } else {
                            return "enter valid password";
                          }
                        },
                        //   if(value=="123456"){
                        //     //return "please enter valid password";
                        //   }
                        // },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintText: "password",
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                      0.1,
                      0.4,
                      0.7,
                      0.9,
                    ],
                        colors: [
                      Colors.purple[700],
                      Colors.purple[500],
                      Colors.purple[500],
                      Colors.purple[600],
                    ])),
                child: ButtonTheme(
                  buttonColor: Colors.white10,
                  height: 50.0,
                  minWidth: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        // scaffoldKey.currentState.showSnackBar(SnackBar(
                        //   content: Text("Login is successful"),
                        // ));

                        // SnackBar mysnackbar=SnackBar(content: Text("Login Successfully"),);
                        // Scaffold.of(context).showSnackBar(mysnackbar);
                        //Navigation Method Best

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAppssUser()));
                        // CupertinoAlertDialog(
                        //   title: Text('sTAtus'),
                        //   content: Text("Successfully logged In"),
                        // );

                        //CORRECT METHOD OF ALERT MESSAGE

                        //  return Alert(context:context,title: "Good to see you",
                        //      desc: "this is description",
                        //  buttons: [
                        //    DialogButton(
                        //      child: Text("ok"),
                        //      onPressed: (){
                        //        Navigator.pop(context);
                        //      },
                        //    )
                        //  ]).show();

                        // AlertDialog(
                        //   title: Text('Accept'),
                        // );

                      } else {
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Login is failed"),
                        ));
                      }
                    },
                    child: Text("LOGIN", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                  child: Text("Forget password?"),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Contact our Developer!!!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }),
              // Text(
              //   "Forget password?",
              //   style: TextStyle(
              //       color: Colors.white, decoration: TextDecoration.underline),
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(
                height: 20.0,
              ),
              // Center(
              //   child: Container(
              //     padding: EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         gradient: LinearGradient(
              //             begin: Alignment.topLeft,
              //             end: Alignment.bottomRight,
              //             stops: [
              //               0.1,
              //               0.4,
              //               0.7,
              //               0.9,
              //             ],
              //             colors: [
              //               Colors.purple[700],
              //               Colors.purple[500],
              //               Colors.purple[500],
              //               Colors.purple[600],
              //             ])),
              //     // child: Text("User Visit",style: TextStyle(color: Colors.white,fontSize: 35)),
              //   ),
              // )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset("assets/google.jpg",
              //       height: 30.0,
              //      ),
              //     SizedBox(
              //       width: 20.0,
              //     ),
              //     Image.asset("assets/twitter.jpg",
              //       height: 30.0,
              //       ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

//
