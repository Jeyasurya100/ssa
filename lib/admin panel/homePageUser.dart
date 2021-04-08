// import 'package:crud_flutter/admin%20panel/userviewL.dart';
import 'package:crud_flutter/main.dart';
import 'package:crud_flutter/photoUpload/allPersonsData.dart';
import 'package:crud_flutter/scoreNotif/main1.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

// import 'addUser.dart';
// import 'admin panel/userviewL.dart';
// import 'admin panel/userviewN.dart';
// import 'admin panel/userviewP.dart';

// void main()=>runApp(new MaterialApp(
//   debugShowCheckedModeBanner: false,
//   home: new MyApp(),
// ));
class MyAppssUser extends StatefulWidget {
  @override
  _MyAppssUserState createState() => _MyAppssUserState();
}

class _MyAppssUserState extends State<MyAppssUser> {
  int _page = 1;
  final _pageOptions = [
    //AddUsers(),
    AllPersonsData(),
    //MyApps(),
    // MyAppsUser(),
    Home(),
    Home1(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.purpleAccent,
        index: 1,
        height: 50.0,
        items: [
          Icon(Icons.home, size: 25, color: Colors.white),
          Icon(Icons.people, size: 25, color: Colors.white),
          Icon(Icons.notifications, size: 25, color: Colors.white),
        ],
        color: Colors.deepPurpleAccent,
        buttonBackgroundColor: Colors.orange,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageOptions[_page],
    );
  }
}

// SAMPLE PART FOR THE THIRD PAGE IN THE BOTTOM NAVIGATION BAR
// class Nothing extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: Text('Empty page'),
//         // ),
//         body: Center(
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.deepPurpleAccent,
//               Colors.purpleAccent,
//             ],
//             begin: Alignment.topRight,
//           ),
//         ),

//         //   Image.asset(
//         //   "assets/shuttlecock.jpg",
//         //   height: 100.0,
//         // ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               ' Nothing To Show Here!!!',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0),
//             ),
//             Icon(Icons.error),
//             // Image(image: AssetImage("assets/ssalogo.jpg"),
//             // fit: BoxFit.cover,),
//           ],
//         ),
//       ),
//     ));
//   }
// }
