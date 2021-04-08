import 'dart:io';

//import 'dart:html';
//import 'package:finalPart/allPersonsData.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'allPersonsData.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp3(),
    ));

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: AllPersonsData(),
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  File _image;
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();

  Future choiceImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future uploadImage() async {
    //final uri = Uri.parse("http://192.168.43.228/API/upload1.php");
    final uri =
        Uri.parse("https://ssaflutterapp.000webhostapp.com/upload1.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = nameController.text;
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      print("image uploaded");
    } else {
      print("image not uploaded");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          // actions: [Icon(Icons.person_add)],
          //primary: true,
          title: Text(
            'Upload Photos Here!',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add_a_photo_outlined),
                  onPressed: () {
                    choiceImage();
                  }),
              Container(
                child: _image == null
                    ? Text('No Image Selected')
                    : Image.file(_image),
                // : Image.file(_image),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text('Upload Image'),
                  onPressed: () {
                    uploadImage();
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Image Uploaded Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    "*important notice!: \n\n You cant delete photos after you will upload so be careful to use "),
              )
            ],
          ),
        ),
      ),
    );
  }
}
