import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ScrollController _controller;
  var nameList = [
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
  ];
  var index = 0;

  _scrollListener() {
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print("It has awakened!!");
    }
  }

  MyApp() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    print("intialized");
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          accentColor: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: null,
            body: Stack(alignment: Alignment.topCenter, children: <Widget>[
              Container(
                  height: double.infinity,
                  color: Colors.black,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(10),
                        controller: _controller,
                        itemCount: nameList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomCard(nameList, index);
                        }),
                  )),
              ClipRRect(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 150,
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                  color: Color.fromRGBO(255, 255, 255, 0.1),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: null),
                          Expanded(
                            child: Container(
                                height: 40,
                                padding: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.search),
                                      border: InputBorder.none),
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Text(
                              'Panchavati',
                              style: TextStyle(
                                  color: Colors.blue[400], fontSize: 12.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            child: IconButton(
                              icon: Icon(
                                Icons.filter_list,
                                size: 25,
                                color: Colors.white,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
            ])));
  }
}

class CustomCard extends StatelessWidget {
  int index;
  var nameList;
  @override
  CustomCard(nameList, index) {
    this.index = index;
    this.nameList = nameList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: 280,
        height: 190,
        decoration: BoxDecoration(
          color: index == 0 ? Colors.black : Colors.grey[800],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: index == 0
            ? SizedBox(
                height: 100,
              )
            : Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(" 09",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500)),
                          Container(
                              margin:
                                  EdgeInsets.only(left: 5, right: 5, top: 2),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/doctor_profile_image.png')))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                nameList[index][0],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(nameList[index][1],
                                      style: TextStyle(fontSize: 14)),
                                  Text(
                                    " | ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  Text(nameList[index][2],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Icon(Icons.thumb_up,
                                      color: Colors.blue, size: 16)
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 20,
                            child: IconButton(
                                icon: Icon(
                                  Icons.verified_user,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                onPressed: null),
                          ),
                          Container(
                              padding: EdgeInsets.all(0),
                              height: 20,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  onPressed: null)),
                          Container(
                              padding: EdgeInsets.all(0),
                              height: 20,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.videocam,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  onPressed: null))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Text(nameList[index][3],
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      FlatButton(
                          onPressed: null,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text(" ₹ 750 ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '778\n',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: 'Feedback',
                                  style: TextStyle(
                                      color: Colors.grey[300], fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '~3.2km~\n',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: 'Gunjan Baba Nagar',
                                  style: TextStyle(color: Colors.grey[400])),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: null,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(right: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.green[800], width: 1.5)),
                              child: Text(
                                ' Call ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: null,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(left: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.green[800], width: 1.5)),
                              child: Text(
                                'Book',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
  }
}
