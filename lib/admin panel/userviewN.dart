import 'dart:convert';
//import 'package:expansion_card/expansion_card.dart';
//import 'package:slimy_card/slimy_card.dart';
//import 'package:divine_card/divine_card.dart';
//import 'package:crud_flutter/loginPage.dart';
//import 'package:crud_flutter/updateUsers.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:crud_flutter/QrScanner/generate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

//import 'package:scoreBoard/updateUsers1.dart';
// import 'updateUsers1.dart';
// import 'addUser1.dart';
//import 'Home1UsersPage.dart';

class Home1UsersUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home1Users(),

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

class Home1Users extends StatefulWidget {
  @override
  _Home1UsersState createState() => _Home1UsersState();
}

class _Home1UsersState extends State<Home1Users> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController;
  bool _isOnTop = true;
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
  // int _page=1;
  // final _pageOptions=[
  //   Home1Users(),
  //   AddUsers(),
  // ];
  //final currentIndex=1;
  // int _page = 0;
  // GlobalKey _bottomNavigationKey = GlobalKey();

  // @override
  // void initState() {
  //   //init state is used for what instance will execute while initiate the app
  //   //getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomPadding: true,
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(Icons.qr_code_rounded),
                    onPressed: () async {
                      // String scaning = await BarcodeScanner.scan();
                      // setState(() {
                      //   qrResult = scaning;
                      // });
                      // ;
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Generate()));
                    })
              ],
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
            body: SmartRefresher(
              scrollController: _scrollController,
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
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
                child: Icon(_isOnTop
                    ? Icons.arrow_downward_sharp
                    : Icons.arrow_upward_sharp))
            // floatingActionButton: FloatingActionButton(
            //   child: Icon(Icons.message),
            //   onPressed: () {
            //     // Navigator.pushNamed(context, '/AddUser1()');
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => AddUser1()));
            //   },
            // ),
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
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        addRepaintBoundaries: true,
        //controller:_scrollController ,
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => UpdateUser1(
                  //               id: list[i]['id'],
                  //               name: list[i]['name'],
                  //               email: list[i]['email'],
                  //             )));
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
                  child: Icon(Icons.notifications),
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
