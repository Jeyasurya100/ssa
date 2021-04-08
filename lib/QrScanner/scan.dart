// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
// import 'package:barcode_scanner/barcode_scanning_data.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrResult = "not yet scanned!";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Scan',
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.purpleAccent,
              ],
              begin: Alignment.topRight,
            ),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "RESULT",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(qrResult, textAlign: TextAlign.center),
              SizedBox(
                height: 20.0,
              ),
              //HERE WE USE SAME FLAT BUTTON
              FlatButton(
                child: Text("SCAN QR CODE"),
                onPressed: () async {
                  //HERE SCANNING FOR QR CODE
                  String scaning = await BarcodeScanner.scan();
                  setState(() {
                    qrResult = scaning;
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.blue, width: 3.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
