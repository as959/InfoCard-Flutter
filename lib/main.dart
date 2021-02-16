import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var nameList = [
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
    ['Dr. Gauri Kannukar', 'Neuro Surgeon', '4.7', 'Sadanand Ayurvedic Clinic'],
  ];
  var index = 0;
  int m, n;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: null,
            body: OrientationBuilder(builder: (context, orientation) {
              orientation == Orientation.portrait ? m = 5 : m = 0;
              return Container(
                  padding: EdgeInsets.all(15.0),
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/map_bg.jpg'),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: <Widget>[
                      Expanded(flex: m, child: SizedBox()),
                      Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(10),
                                itemCount: nameList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomCard(nameList, index);
                                }),
                          ))
                    ],
                  ));
            })));
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
    return Stack(children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: 45, left: 10, right: 10),
          width: 300,
          height: 210,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.7),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: ClipRRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 1),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(" 09",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Row(
                            children: <Widget>[
                              Text(
                                " ~3.2km~",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: null)
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                  " | ",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                Text(nameList[index][2],
                                    style: TextStyle(fontSize: 12)),
                                Icon(Icons.thumb_up,
                                    color: Colors.blue, size: 16)
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(nameList[index][3],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.purple)),
                            const Divider(
                              color: Colors.white,
                              height: 10,
                              thickness: 3.0,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                      onPressed: null,
                                      child: Icon(Icons.chat_bubble,
                                          size: 20, color: Colors.black54)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                      onPressed: null,
                                      child: Icon(Icons.videocam,
                                          size: 25, color: Colors.black54)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                      onPressed: null,
                                      child: Icon(Icons.call,
                                          size: 25, color: Colors.black54)),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: FlatButton(
                                        onPressed: null,
                                        child: Container(
                                          child: Text("750",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.green)),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                          ),
                                        )))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )))),
      Container(
          margin: EdgeInsets.only(left: 30.0),
          child: CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage("assets/doctor_profile_image.png"),
          ))
    ]);
  }
}
