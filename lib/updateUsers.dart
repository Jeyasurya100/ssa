import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
// import 'package:rflutter_alert/rflutter_alert.dart';

class UpdateUsers extends StatefulWidget {
  final String id;
  final String name;
  final String email;

  const UpdateUsers({Key key, this.id, this.name, this.email})
      : super(key: key);
  @override
  _UpdateUsersState createState() => _UpdateUsersState();
}

class _UpdateUsersState extends State<UpdateUsers> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final txtFullName = new TextEditingController();
  final txtEmail = new TextEditingController();
  bool _valName = false;
  bool _valEmail = false;

  //update

  Future _updateDetails(String name, String email) async {
    var url = "https://ssaflutterapp.000webhostapp.com/updateUser.php";
    final response = await http
        .post(url, body: {"name": name, "email": email, "id": widget.id});
    var res = response.body;
    //print(res);
    if (res == "true") {
      // AlertDialog(
      //   title: Text('Accept'),
      // );

      Navigator.pop(context);

      // showAboutDialog(context:context,
      //     applicationVersion: '1.0',
      //     applicationIcon:Icon(Icons.landscape) ,
      //     applicationLegalese: "Details 'UPDATED' successfully if you want to see the changes, just relaunch this application");
      //

    } else {
      print("Error:" + res);
    }
  }

  //Delete

  Future _deleteUser() async {
    var url = "https://ssaflutterapp.000webhostapp.com/deleteUser.php";
    final response = await http.post(url, body: {"id": widget.id});
    var res = response.body;
    // print(res);
    if (res == "true") {
      //Navigator.pushNamed(context,'/addUser');
      //Navigator.popAndPushNamed(context,'/main');
      Navigator.pop(context);
      // showAboutDialog(
      //     context: context,
      //     applicationVersion: '1.0',
      //     applicationIcon: Icon(Icons.landscape),
      //     applicationLegalese:
      //         "Details 'DELETED' successfully if you want to see the changes, just relaunch this application");
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
  void initState() {
    txtFullName.text = widget.name;
    txtEmail.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
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
          //primary: true,
          title: Text(
            'Update Details Here!',
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
        // resizeToAvoidBottomInset:
        //     true, //used for solve "bottom overloaded by 145 pixels"
        // appBar: AppBar(
        //   title: Text('Update User'),
        // ),

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
                    child: Text(
                      'Update Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          txtFullName.text.isEmpty
                              ? _valName = true
                              : _valName = false;
                          txtEmail.text.isEmpty
                              ? _valEmail = true
                              : _valEmail = false;
                          if (_valName == false && _valEmail == false) {
                            // AlertDialog(
                            //   title: Text('Accept'),
                            // );

                            _updateDetails(txtFullName.text, txtEmail.text);
                            // return Alert(
                            //     context: context,
                            //     title: "Suggestion",
                            //     desc:
                            //         "Details are updated successfully,if you want to see the changes just relaunch this app !!!",
                            //     buttons: [
                            //       DialogButton(
                            //         child: Text("ok"),
                            //         onPressed: () {
                            //           Navigator.pop(context);
                            //         },
                            //       )
                            //     ]);

                            // scaffoldKey.currentState.showSnackBar(SnackBar(
                            //     content: Text("Login is successful completed and if you want to know anything just refresh the app")))

                          }
                          Fluttertoast.showToast(
                              msg:
                                  "details updated successfully, if u want to see the changes just relaunch this app",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        // _saveDetails(txtFullName.text,txtEmail.text);
                      );
                    },
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text('Delete',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      _deleteUser();
                      Fluttertoast.showToast(
                          msg:
                              "details Deleted successfully, if u want to see the changes just relaunch this app",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      // Navigator.pop(context,'/main');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
