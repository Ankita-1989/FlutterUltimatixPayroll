import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/commonWidget/menu_item.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

class TicketApprovalDetail extends StatefulWidget {
  @override
  _TicketApprovalDetailState createState() => _TicketApprovalDetailState();
}

enum Status { Closed, OnHold }

class _TicketApprovalDetailState extends State<TicketApprovalDetail> {
  TextEditingController _txtDisController = TextEditingController();
  TextEditingController _txtResController = TextEditingController();

  Status _site = Status.Closed;

  @override
  Widget build(BuildContext context) {
    Widget _myWidget = Container(
        margin: EdgeInsets.only(left: 12, right: 12, top: 5),
        child: Card(
          elevation: 12.0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MenuItem(title: "Ticket Generate Date", title1: "24/12/2019"),
                Container(
                  height: .5,
                  color: COLOR.textcolor,
                ),
                MenuItem(title: "Ticket Generate Time", title1: "16:55"),
                Container(
                  height: .5,
                  color: COLOR.textcolor,
                ),
                MenuItem(title: "Employee", title1: "0002 Mr. Sandip patel"),
                Container(
                  height: .5,
                  color: COLOR.textcolor,
                ),
                MenuItem(title: "Ticket Assign", title1: "IT"),
                Container(
                  height: .5,
                  color: COLOR.textcolor,
                ),
                MenuItem(title: "Ticket Type", title1: "Ticket 1"),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 9),
                  child: TextFormField(
                    maxLines: 1,
                    cursorColor: COLOR.PrimaryColor,
                    controller: _txtDisController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: COLOR.textcolor, width: .5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR.textcolor),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR.textcolor),
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      hintText: "Ticket Description",
                      hintStyle: FONT_CONST.REGULAR_HINT,
                    ),
                    style: FONT_CONST.REGULAR_BLACK1_13,
                  ),
                ),
                Container(
                  height: .5,
                  color: COLOR.textcolor,
                ),
                MenuItem(title: "Ticket Priority", title1: "Medium"),
                Container(
                  height: .5,
                  color: COLOR.textcolor,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Attach Document",
                          style: FONT_CONST.SEMIBOLD_BLACK_12,
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: Icon(Icons.attachment),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 0.5,
                  color: COLOR.textcolor,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 9),
                  child: TextFormField(
                    maxLines: 1,
                    cursorColor: COLOR.PrimaryColor,
                    controller: _txtResController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: COLOR.textcolor, width: .5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR.textcolor),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: COLOR.textcolor),
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      hintText: "Resolution Description",
                      hintStyle: FONT_CONST.REGULAR_HINT,
                    ),
                    style: FONT_CONST.REGULAR_BLACK1_13,
                  ),
                ),
                Container(
                  height: 0.5,
                  color: COLOR.textcolor,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Ticket Status",
                          style: FONT_CONST.SEMIBOLD_BLACK_12,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Status.Closed,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor: COLOR.PrimaryColor,
                            groupValue: _site,
                            onChanged: (Status value) {
                              setState(() {
                                _site = value;
                              });
                            },
                          ),
                          Text('Closed'),
                          Radio(
                            value: Status.OnHold,
                            groupValue: _site,
                            activeColor: COLOR.PrimaryColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (Status value) {
                              setState(() {
                                _site = value;
                              });
                            },
                          ),
                          Text(
                            "On Hold",
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Attach Resolution Document",
                          style: FONT_CONST.SEMIBOLD_BLACK_12,
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: Icon(Icons.attachment),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 0.5,
                  color: COLOR.textcolor,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: 40,
                              margin: EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                color: COLOR.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: COLOR.BORDER,
                                  width: 1.5,
                                ),
                              ),
                              child: OutlineButton(
                                  child: new Text(
                                    "Clear",
                                    style: TextStyle(
                                        color: COLOR.BLACK, fontSize: 13),
                                  ),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (BuildContext
                                    //         context) =>
                                    //             ProfileScreen()));
                                  },
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0))))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: 40,
                              margin: EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                color: COLOR.SELECTED_COLOR,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  width: 1.5,
                                ),
                              ),
                              child: OutlineButton(
                                  child: new Text(
                                    "Apply",
                                    style: TextStyle(
                                        color: COLOR.white, fontSize: 13),
                                  ),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //       builder: (BuildContext
                                    //       context) =>
                                    //           MyAttendance()));
                                  },
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0))))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 20),
          decoration: CommonMethod.baseBackgroundDecoration,
          child: Stack(
            children: <Widget>[
              Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: new AppBar(
                    leading: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: COLOR.white,
                        size: 16,
                      ),
                    ),
                    title: new Text(
                      "Ticket Close",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                  body: _myWidget),
            ],
          ),
        ));
  }
}
