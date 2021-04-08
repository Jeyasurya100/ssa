import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

import 'main.dart';

//import 'package:image_picker_saver/image_picker_saver.dart';
//import 'package:flutter/services.dart';
//import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllPersonsData extends StatefulWidget {
  @override
  _AllPersonsDataState createState() => _AllPersonsDataState();
}

class _AllPersonsDataState extends State<AllPersonsData> {
  ScrollController _scrollController;
  bool _isOnTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
    setState(() => _isOnTop = true);
  }

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    setState(() => _isOnTop = false);
  }

  Future allPersons() async {
    //var url = "http://192.168.43.228/API/viewAll1.php";
    var url = "https://ssaflutterapp.000webhostapp.com/viewAll1.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //maintainBottomViewPadding: false,
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.add_a_photo_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp2(),
                    ),
                  );
                },
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            // actions: [Icon(Icons.person_add)],
            //primary: true,
            title: Text(
              'Photos',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'IndieFlower',
                fontSize: 23.5,
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
            child: FutureBuilder(
              future: allPersons(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                        reverse: true,
                        controller: _scrollController,
                        addRepaintBoundaries: true,
                        shrinkWrap: true,

                        //reverse: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 10.0,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ListTile(
                                  title: Container(
                                    // width: 300,
                                    // height: 300,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://ssaflutterapp.000webhostapp.com/uploads/${list[index]['image']}",
                                      fit: BoxFit.cover,
                                    ),
                                    // child: Image.network(
                                    //   "http://192.168.43.228/API/uploads/${list[index]['image']}",

                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                  subtitle: Center(
                                      child: Text(
                                    list[index]['name'],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                borderOnForeground: true),
                          );
                        })
                    : Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.orangeAccent,
                        ),
                      );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
              child: Icon(_isOnTop ? Icons.arrow_upward : Icons.arrow_downward))
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => MyApp2(),
          //       ),
          //     );
          //   },
          //   child: Icon(Icons.add_a_photo),
          // ),
          ),
    );
  }
}
