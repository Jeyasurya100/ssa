import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  final qrText = TextEditingController();

  String qrData = "https://github.com/neon97";
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
            'Generate',
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
            // height: double.infinity,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       Colors.deepPurpleAccent,
            //       Colors.purpleAccent,
            //     ],
            //     begin: Alignment.topRight,
            //   ),
            // ),
            padding: EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 130.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //NOW WE WILL
                  Center(
                    child: Container(
                      height: 250.0,
                      width: 250.0,
                      child: QrImage(data: qrData),
                    ),
                  ), //DATA IS NOTHING BUT THE DATA OE THE URL
                  //now let create that how the user can make hisqwn qr code
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Get your data/link to the QR CODE ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: qrText,

                    decoration: InputDecoration(
                      hintText: "Enter The Data/Link",
                    ),
                    //here we create the action button that will create the qr code
                    //one thing there nothing that it needs to generate just change the data of the QR image and change the state automatically generate

                    //Making the floating action button like before
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    child: Text("GENERATE QR CODE"),
                    onPressed: () async {
                      //we are working with text field so we need a little validation
                      if (qrText.text.isEmpty) {
                        //if the text field is empty then it generate flutter.dev qr code
                        setState(() {
                          qrData = "https://flutter.dev";
                        });
                      } else {
                        setState(() {
                          qrData = qrText.text;
                        });
                      }
                      qrText.clear();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.blue, width: 3.0)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
