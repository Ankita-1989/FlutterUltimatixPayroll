import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/list/list_newsfeed.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:intl/intl.dart';

import '../utils/COLOR.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  var Monthname, year;
  bool isStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    Monthname = DateFormat.MMMM().format(now);
    year = DateFormat.y().format(now);

  }

  @override
  Widget build(BuildContext context) {
    var itemCount = 2;
    Widget _myWidget = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: COLOR.white,
                      size: 16,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    "News Feed",
                    style: TextStyle(
                      color: COLOR.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          margin: EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            color: COLOR.Status,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: COLOR.Status,
                              width: 1.5,
                            ),
                          ),
                          child: OutlineButton(
                              child: new Text(
                                "Manager    Announcement",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: COLOR.white, fontSize: 12),
                              ),
                              onPressed: () {
                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(25))))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          height:50,
                          margin: EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            color: COLOR.PrimaryColor,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: COLOR.PrimaryColor,
                              width: 1.5,
                            ),
                          ),
                          child: OutlineButton(
                              child: new Text(
                                "Organization Announcement",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: COLOR.white, fontSize: 12),
                              ),
                              onPressed: () {},
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(25))))),
                ],
              ),
            ),
            Flexible(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: itemCount > 0
                    ? ListView.builder(
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          return newsfeed(context, index);
                        },
                      )
                    : Center(child: const Text('No items')),
              ),
            )
          ],
        ),
      ),
    );
    return Scaffold(
      body: _myWidget,
    );
  }
}
