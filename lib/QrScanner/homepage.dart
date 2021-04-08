import 'package:crud_flutter/QrScanner/generate.dart';
import 'package:crud_flutter/QrScanner/scan.dart';
import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// import 'package:qrscanner/generate.dart';
// import 'package:qrscanner/scan.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add_a_photo_outlined),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => MyApp2(),
        //         ),
        //       );
        //     },
        //   )
        // ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        // actions: [Icon(Icons.person_add)],
        //primary: true,
        title: Text(
          'QR CODE',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'IndieFlower',
            fontSize: 25.5,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.orangeAccent,

        shadowColor: Colors.black,
        centerTitle: true,
        // backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.purpleAccent,
              ],
              begin: Alignment.topRight,
            ),
          ),
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                  image: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/000/667/730/non_2x/people-scanning-qr-code-for-payment-via-smartphone.jpg")),
              flatButton("Scan QR CODE", Scan()),
              SizedBox(
                height: 10.0,
              ),
              flatButton("Generate QR CODE", Generate())
            ],
          ),
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.blue, width: 3.0)),
      child: Text(text),
    );
  }
}
