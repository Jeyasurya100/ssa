import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:crud_flutter/photoUpload/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';

//import 'main.dart';

//import 'package:image_picker_saver/image_picker_saver.dart';
//import 'package:flutter/services.dart';
//import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:image_share/image_share.dart';
// import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllPersonDataUser extends StatefulWidget {
  @override
  _AllPersonDataUserState createState() => _AllPersonDataUserState();
}

class _AllPersonDataUserState extends State<AllPersonDataUser> {
  var filePath;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController;
  bool _isOnTop = true;

  get index => null;

  get list => null;
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    //list.add((list.length).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

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
            'Posts',
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

        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(
            waterDropColor: Colors.green,
          ),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            _refreshController.refreshCompleted();
          },
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("pull up load");
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = Text("release to load more");
              } else {
                body = Text("No more Data");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          // onRefresh: _onRefresh,
          onLoading: _onLoading,
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
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 10.0,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ListTile(
                                  title: PinchZoomImage(
                                    image: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://ssaflutterapp.000webhostapp.com/uploads/${list[index]['image']}"),
                                    ),
                                    hideStatusBarWhileZooming: false,
                                    zoomedBackgroundColor:
                                        Color.fromRGBO(240, 240, 240, 1.0),

                                    // width: 300,
                                    // height: 300,
                                    // child: CachedNetworkImage(
                                    //   imageUrl:
                                    //       "https://ssaflutterapp.000webhostapp.com/uploads/${list[index]['image']}",
                                    //   fit: BoxFit.cover,
                                    // ),
                                    // child: Image.network(
                                    //   "http://192.168.43.228/API/uploads/${list[index]['image']}",

                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                  subtitle: Center(
                                    child: Column(
                                      children: [
                                        Center(
                                            child: Text(
                                          list[index]['name'],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        // Container(
                                        //   child: IconButton(
                                        //     // color: Colors.transparent,
                                        //     icon: Icon(Icons.download_outlined),
                                        //     onPressed: () {
                                        //       // Share_image();
                                        //       // downloadImage();
                                        //     },
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
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
        ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
        //     child: Icon(_isOnTop
        //         ? Icons.arrow_upward_outlined
        //         : Icons.arrow_downward_outlined))

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

  // ignore: non_constant_identifier_names
  // void Share_image() async => await ImageShare.shareImage(
  //     filePath: "https://ssaflutterapp.000webhostapp.com/uploads/");

  // void _onLoadingg(bool t) {
  //   if (t) {
  //     showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (BuildContext context) {
  //           return SimpleDialog(
  //             backgroundColor: Colors.transparent,
  //             children: [
  //               new CircularProgressIndicator(
  //                 // strokeWidth: ,
  //
  //                 backgroundColor: Colors.orange,
  //               ),
  //               Center(
  //                   child: new Text(
  //                 "Downloading...",
  //                 style: TextStyle(color: Colors.white),
  //               )),
  //             ],
  //           );
  //         });
  //   } else {
  //     // Navigator.pop(context);
  //     showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (BuildContext context) {
  //           return SimpleDialog(
  //             children: [
  //               new Text(
  //                   "Image Downloaded Successfully Check Your Gallery To See That Image!!!")
  //             ],
  //           );
  //         });
  //
  //     Future.delayed(const Duration(seconds: 3), () {
  //       // Navigator.pop(context);
  //     });
  //   }
  // }

  // Future<void> downloadImage() async {
  //   _onLoadingg(true);
  //   String gets = 'https://ssaflutterapp.000webhostapp.com/viewAll1.php';
  //   var response = await http.get(gets);
  //   filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  //   _onLoadingg(false);
  // }
}
