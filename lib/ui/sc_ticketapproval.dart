import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/ui/sc_ticketapprovaldetail.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';

enum WidgetMarker { open, onHold, closed }

class WidgetSwitchDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TicketApproval(),
      ),
    );
  }
}

class TicketApproval extends StatefulWidget {
  @override
  _TicketApprovalState createState() => _TicketApprovalState();
}

class _TicketApprovalState extends State<TicketApproval> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.open;

  var itemCount = 2;
  var isSelected = true;
  List<Color> _colors = <Color>[Colors.orange, Colors.green];

  var _currentColorIndex=0;
  void _incrementColorIndex() {
    setState(() {
      if (_currentColorIndex < _colors.length - 1) {
        _currentColorIndex++;
      } else {
        _currentColorIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _myWidget = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //change here don't //worked
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: COLOR.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      "Ticket Approval",
                      style: TextStyle(
                        color: COLOR.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 46,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: _colors[0],
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: _colors[_currentColorIndex],
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                                child: new Text(
                                  "Open",
                                  style: TextStyle(
                                      color: COLOR.white, fontSize: 12),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _currentColorIndex=0;
                                    _incrementColorIndex();
                                    selectedWidgetMarker = WidgetMarker.open;
                                  });
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0))))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 46,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: _colors[1],
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.Status,
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                                child: new Text(
                                  "On Hold",
                                  style: TextStyle(
                                      color: COLOR.white, fontSize: 12),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _currentColorIndex=0;
                                    _incrementColorIndex();
                                    selectedWidgetMarker = WidgetMarker.onHold;
                                  });
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0))))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 46,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: _colors[1],
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.Status,
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                                child: new Text(
                                  "Close",
                                  style: TextStyle(
                                      color: COLOR.white, fontSize: 12),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _currentColorIndex=0;
                                    _incrementColorIndex();
                                    selectedWidgetMarker = WidgetMarker.closed;
                                  });
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0))))),
                  ],
                ),
              ),
              Container(
                child: getChildContainer(),
              )
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      body: _myWidget,
    );
  }

  Widget getChildContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.open:
        return getOpen();
      case WidgetMarker.onHold:
        return Container();
      case WidgetMarker.closed:
        return Container();
    }
    return getOpen();
  }

  Widget getOpen() {
    return Container(
        child: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: itemCount > 0
          ? ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            TicketApprovalDetail()));
                    // _onSelected(index);
                    print(index);
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(
                        color: COLOR.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 1.0, // soften the shadow
                            //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              2.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                        border:
                            Border.all(width: 1, color: Colors.transparent)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/emp.png",
                          width: 70,
                          height: 70,
                          alignment: Alignment.bottomLeft,
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin:
                                    EdgeInsets.only(left: 6, top: 5, bottom: 5),
                                child: Text("0002 Mr. Sandip Patel",
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3, bottom: 5),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 30,
                                      child: Icon(
                                        Icons.date_range,
                                        size: 16,
                                      ),
                                    ),
                                    Text('02/12/2019',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(left: 6, top: 3, bottom: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text('Priority:',
                                        style: TextStyle(
                                          color: Colors.orange[600],
                                          fontSize: 12,
                                        )),
                                    Text('Medium',
                                        style: TextStyle(
                                          color: Colors.orange[600],
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(child: const Text('No items')),
    ));
  }
}
