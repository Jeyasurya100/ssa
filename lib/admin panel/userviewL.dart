import 'dart:convert';
// import 'dart:html';
//import 'dart:html';

// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:crud_flutter/loginPage.dart';
// import 'package:crud_flutter/updateUsers.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:crud_flutter/QrScanner/scan.dart';
import 'package:flutter/services.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/services.dart';
//import 'addUser.dart';
//import 'HomeUserPage.dart';

// void main() => runApp(MyAppsUser());

class MyAppsUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUser(),
      // home: AnimatedSplashScreen(
      //     splash: Image.asset(
      //       'assets/splash.jpg',
      //       fit: BoxFit.fill,
      //     ),
      //     splashIconSize: double.infinity,
      //     splashTransition: SplashTransition.slideTransition,
      //     pageTransitionType: PageTransitionType.bottomToTop,
      //     duration: 3000,
      //     nextScreen: MyApp()),
      // HomeUser: MyApp(),
      // routes: <String, WidgetBuilder>{
      //   '/addUser': (BuildContext context) => new AddUsers()
      // },
    );
  }
}

//Future is used for when fetching data from online

Future<List> getData() async {
  //async must use when using Future
  var url = "https://ssaflutterapp.000webhostapp.com/getData.php";
  final response = await http.get(url);
  var dataReceived = json.decode(response.body);
  //print(dataReceived);
  return dataReceived;
}

class HomeUser extends StatefulWidget {
  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  String qrResult = "not yet scanned!";
  // int _page=1;
  // final _pageOptions=[
  //   MyApp(),
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
    return Scrollbar(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(Icons.qr_code_scanner),
                  onPressed: () async {
                    // String scaning = await BarcodeScanner.scan();
                    // setState(() {
                    //   qrResult = scaning;
                    // });
                    // ;
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Scan()));
                  })
            ],

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            // actions: [Icon(Icons.list)],
            //primary: true,
            title: Text(
              'Players Details',
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
          //   title: Text('Registered Details'),
          // ),
          body: Container(
            child: Container(
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
                                backgroundColor: Colors.orangeAccent),
                          );
                  }),
            ),
            // child: Container(
            //   constraints: BoxConstraints.expand(),
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: NetworkImage(
            //               "https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
            //           fit: BoxFit.cover)),
            //   child: new FutureBuilder<List>(
            //       future: getData(),
            //       builder: (context, snapshot) {
            //         if (snapshot.hasError) {
            //           print('Error in loading' + snapshot.error.toString());
            //         }
            //         return snapshot.hasData
            //             ? new ItemList(
            //                 list: snapshot.data,
            //               )
            //             : new Center(
            //                 child: CircularProgressIndicator(),
            //               );
            //       }),
            // ),

            //FLOATING ACTION BUTTON
            // floatingActionButton: FloatingActionButton(
            //   child: Icon(Icons.add),
            //   onPressed: (){
            //    Navigator.pushNamed(context,'/addUser');
            //   },
            // ),

            // bottomNavigationBar: CurvedNavigationBar(
            //  index: 1,
            //  height: 50.0,
            //
            //
            //   items: [
            //
            //       Icon(Icons.search, size: 25),
            //       Icon(Icons.HomeUser, size: 25),
            //       Icon(Icons.add, size: 25,),
            //   ],
            //
            //
            //   color: Colors.white,
            //   buttonBackgroundColor: Colors.white,
            //   backgroundColor: Colors.blueAccent,
            //   animationCurve: Curves.easeInOut,
            //   animationDuration: Duration(milliseconds: 600),
            //
            //
            //   onTap: (int index){
            //    print(index.toString());
            //    setState(() {
            //      _page=index;
            //    });
            //   // currentIndex=index;
            //   },
            // ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => AddUsers()));
          //   },
          //   child: Icon(Icons.add),
          // ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  const ItemList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => UpdateUsers(
                //               id: list[i]['id'],
                //               name: list[i]['name'],
                //               email: list[i]['email'],
                //             )));
              },

              //initial letter on the rounded bar

              leading: CircleAvatar(
                child: Text(list[i]['name']
                    .toString()
                    .substring(0, 1)
                    .toUpperCase()), //this substring used for print first letter in that circle
              ),
              title: new Text(
                list[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: new Text(
                list[i]['email'],
                style: TextStyle(fontSize: 15),
              ),
            ),
          );
        });
  }
}
