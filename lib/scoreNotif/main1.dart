import 'dart:convert';
//import 'package:expansion_card/expansion_card.dart';
//import 'package:slimy_card/slimy_card.dart';
//import 'package:divine_card/divine_card.dart';
//import 'package:crud_flutter/loginPage.dart';
//import 'package:crud_flutter/updateUsers.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

//import 'package:scoreBoard/updateUsers1.dart';
import 'updateUsers1.dart';
import 'addUser1.dart';
//import 'Home1Page.dart';

class Homes1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home1(),

      // routes: <String, WidgetBuilder>{
      //   '/addUser': (BuildContext context) => new AddUsers()
      // },
    );
  }
}

//Future is used for when fetching data from online

Future<List> getData() async {
  //async must use when using Future
  //var url = "http://192.168.43.228/API/Notification/getData1.php";
  var url = "https://ssaflutterapp.000webhostapp.com/getData1.php";
  final response = await http.get(url);
  var dataReceived = json.decode(response.body);
  //print(dataReceived);
  return dataReceived;
}

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  // int _page=1;
  // final _pageOptions=[
  //   Home1(),
  //   AddUsers(),
  // ];
  //final currentIndex=1;
  // int _page = 0;
  // GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    //init state is used for what instance will execute while initiate the app
    //getData();
    super.initState();
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
          //primary: true,
          title: Text(
            'Notifications & Scores',
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
        //     body: Container(
        //   height: 150,
        //   width: double.infinity,
        //   color: Colors.blue,
        //   child: ExpansionCard(
        //     background: Image(
        //       image: AssetImage("assets/cardbg.jpg"),
        //       fit: BoxFit.f,
        //     ),
        //     backgroundColor: Colors.transparent,
        //     title: Container(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text("header"),
        //           Text("sub"),
        //         ],
        //       ),
        //     ),
        //     children: <Widget>[
        //       Container(
        //         margin: EdgeInsets.symmetric(horizontal: 7),
        //         child: Text("content goes over here"),
        //       )
        //     ],
        //   ),
        // )
        //********************************************************************************************** */
        //BELOW CODES ARE IMPORTANT
        body: Container(
          //padding: EdgeInsets.all(8.0),
          // color: Colors.deepPurpleAccent,
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

          //child: OtpScreen(),
          child: new FutureBuilder<List>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Error in loading' + snapshot.error.toString());
                }
                return snapshot.hasData
                    ? new ItemList(
                        list: snapshot.data,
                      )
                    : new Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.orangeAccent,
                        ),
                      );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {
            // Navigator.pushNamed(context, '/AddUser1()');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddUser1()));
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  const ItemList({Key key, this.list}) : super(key: key);
  // bool semanticContainer=true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        reverse: true,
        addAutomaticKeepAlives: true,
        addSemanticIndexes: true,
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Card(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: ListTile(
                isThreeLine: true,

                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateUser1(
                                id: list[i]['id'],
                                name: list[i]['name'],
                                email: list[i]['email'],
                              )));
                },

                //initial letter on the rounded bar

//CIRCULAR AVATAR PART
                // leading: CircleAvatar(
                //   child: Text(list[i]['name']
                //       .toString()
                //       .substring(0, 1)
                //       .toUpperCase()
                //       .trim()), //this substring used for print first letter in that circle
                // ),
                leading: CircleAvatar(
                  child: Icon(Icons.notifications_active_outlined),
                ),
                //dense: true,
                title: new Text(
                  list[i]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: new Text(
                  list[i]['email'],
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                //tileColor: Colors.transparent,
                // hoverColor: Colors.blueAccent,
                // focusColor: Colors.red,
                // tileColor: Colors.transparent),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30.0)),
              ));
        });
  }
}
