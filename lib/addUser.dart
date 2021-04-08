//import 'package:crud_flutter/main.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AddUsers extends StatefulWidget {
  @override
  _AddUsersState createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  final txtFullName = new TextEditingController();
  final txtEmail = new TextEditingController();
  bool _valName = false;
  bool _valEmail = false;

  _AddUsersState();

  Future _saveDetails(String name, String email) async {
    var url = "https://ssaflutterapp.000webhostapp.com/saveData.php";
    final response = await http.post(url, body: {"name": name, "email": email});

    var res = response.body;
    if (res == "true") {
      txtEmail.clear();
      txtFullName.clear();

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
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          // actions: [Icon(Icons.person_add)],
          //primary: true,
          title: Text(
            'Add Users Details Here',
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
          padding: EdgeInsets.zero,
          child: Container(
            constraints: BoxConstraints.expand(),
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
            // //child: OtpScreen(),

            // decoration: BoxDecoration(
            // image: DecorationImage(
            // image: NetworkImage("https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
            // fit: BoxFit.cover)
            // ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: new InputDecoration(
                    hintText: "enter your Name",
                    hintStyle: TextStyle(fontSize: 17.0),
                    labelText: "Full Name",
                    labelStyle:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                    errorText: _valName ? 'Name Can\'t Be Empty' : null,
                  ),
                  controller: txtFullName,
                ),
                TextField(
                  decoration: new InputDecoration(
                    hintText: "enter your Email",
                    hintStyle: TextStyle(fontSize: 17.0),
                    labelText: "Mail Id",
                    labelStyle:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                    errorText: _valEmail
                        ? 'Email Can\'t Be Empty'
                        : null, //here can\'t is escape sequence
                  ),
                  controller: txtEmail,
                ),
                ButtonBar(
                  children: [
                    RaisedButton(
                      color: Colors.green,
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
                            msg: "Details has been added successfully.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
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
          //           builder:(context) =>AddUsers()));
          //     }else if(index==1){
          //       //Navigator.pop(context);
          //       Navigator.pop(context,MaterialPageRoute(
          //           builder:(context) =>MyApp()));
          //     }
          //     // currentIndex=index;
          //   },
          // ),
        ),
      ),
    );
  }
}
