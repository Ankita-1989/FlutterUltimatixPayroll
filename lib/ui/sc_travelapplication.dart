import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';
import 'package:intl/intl.dart';

import 'Dashboard/sc_dashbord.dart';

class TravelApplicationScreen extends StatefulWidget {
  @override
  _TravelApplicationScreenState createState() =>
      _TravelApplicationScreenState();
}

class _TravelApplicationScreenState extends State<TravelApplicationScreen> {
  String _selectedDate = "";

  Future<void> _selectDate(
      BuildContext context, int first_year, int second_year) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(first_year),
      lastDate: DateTime(second_year),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMd("en_US").format(d);
      });
  }

  var value = 'Gujarat';
  var value1 = 'Bhavnagar';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    super.initState();
    var now = new DateTime.now();
    _selectedDate = DateFormat.yMMMd("en_US").format(now);
  }

  @override
  Widget build(BuildContext context) {
    Widget _travelDetail = Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Travel Details",
                style: FONT_CONST.BOLD_BLACK_14,
              ),
              Container(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(
                        color: COLOR.BLACK,
                        height: 1,
                      ),
                      iconSize: 35,
                      hint: Text(
                        'Select State',
                        style: FONT_CONST.SEMIBOLD_BLACK_12,
                      ),
                      style: FONT_CONST.SEMIBOLD_BLACK_12,
                      iconEnabledColor: COLOR.BLACK,
                      items: <String>[
                        'Gujarat',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newKey) {
                        setState(() {
                          value = newKey;
                        });
                      })),
              Container(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(
                        color: COLOR.BLACK,
                        height: 1,
                      ),
                      iconSize: 35,
                      hint: Text(
                        'Select City',
                        style: FONT_CONST.SEMIBOLD_BLACK_12,
                      ),
                      style: FONT_CONST.SEMIBOLD_BLACK_12,
                      iconEnabledColor: COLOR.BLACK,
                      items: <String>[
                        'Bhavnagar',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newKey) {
                        setState(() {
                          value1 = newKey;
                        });
                      })),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Place To Visit",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Purpose",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ),
              ),
              Container(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(
                        color: COLOR.BLACK,
                        height: 1,
                      ),
                      iconSize: 35,
                      hint: Text(
                        'Instruct By',
                        style: FONT_CONST.SEMIBOLD_BLACK_12,
                      ),
                      iconEnabledColor: COLOR.BLACK,
                      items: <String>[
                        'Bhavnagar',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newKey) {
                        setState(() {
                          value1 = newKey;
                        });
                      })),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "From Date",
                              style: FONT_CONST.BOLD_BLACK_12,
                            ),
                            margin: EdgeInsets.only(
                              left: 2,
                              top: 10,
                            ),
                          ),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              InkWell(
                                child: Text(_selectedDate,
                                    style: TextStyle(
                                        fontSize: 12, color: COLOR.BLACK)),
                                onTap: () {
                                  _selectDate(context, 2020, 2026);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: () {
                                  _selectDate(context, 2020, 2026);
                                },
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "To Date",
                            style: FONT_CONST.BOLD_BLACK_12,
                          ),
                          margin: EdgeInsets.only(
                            left: 2,
                            top: 10,
                          ),
                        ),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                              child: Text(_selectedDate,
                                  style: TextStyle(
                                      fontSize: 12, color: COLOR.BLACK)),
                              onTap: () {
                                _selectDate(context, 2021, 2026);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_drop_down),
                              onPressed: () {
                                _selectDate(context, 2021, 2026);
                              },
                            ),
                          ],
                        )),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Period",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Remark",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
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
                margin:
                    EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 38,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.BORDER_COLOR,
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                              child: new Text(
                                "Clear",
                                style: TextStyle(
                                    color: COLOR.BLACK,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 38,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.SELECTED_COLOR,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.SELECTED_COLOR,
                              ),
                            ),
                            child: OutlineButton(
                              child: new Text(
                                "Submit",
                                style: TextStyle(
                                    color: COLOR.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ));
    Widget _otherDetail = Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Other Details",
                style: FONT_CONST.BOLD_BLACK_14,
              ),
              Container(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(
                        color: COLOR.BLACK,
                        height: 1,
                      ),
                      iconSize: 35,
                      hint: Text(
                        'Select Mode',
                        style: FONT_CONST.SEMIBOLD_BLACK_12,
                      ),
                      iconEnabledColor: COLOR.BLACK,
                      items: <String>[
                        'Gujarat',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newKey) {
                        setState(() {
                          value = newKey;
                        });
                      })),
              Container(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(
                        color: COLOR.BLACK,
                        height: 1,
                      ),
                      iconSize: 35,
                      hint: Text(
                        'From Date',
                        style: FONT_CONST.SEMIBOLD_BLACK_12,
                      ),
                      iconEnabledColor: COLOR.BLACK,
                      items: <String>[
                        'Bhavnagar',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newKey) {
                        setState(() {
                          value1 = newKey;
                        });
                      })),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "From Time",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Description",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Amount",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
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
                margin:
                    EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 38,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.BORDER_COLOR,
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                              child: new Text(
                                "Clear",
                                style: TextStyle(
                                    color: COLOR.BLACK,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 38,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.SELECTED_COLOR,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.SELECTED_COLOR,
                              ),
                            ),
                            child: OutlineButton(
                              child: new Text(
                                "Submit",
                                style: TextStyle(
                                    color: COLOR.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ));
    Widget _advanceDetails = Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Advance Details",
                style: FONT_CONST.BOLD_BLACK_14,
              ),
              Container(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(
                        color: COLOR.BLACK,
                        height: 1,
                      ),
                      iconSize: 35,
                      hint: Text(
                        'Expenses Type',
                        style: FONT_CONST.SEMIBOLD_BLACK_12,
                      ),
                      iconEnabledColor: COLOR.BLACK,
                      items: <String>[
                        'Gujarat',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newKey) {
                        setState(() {
                          value = newKey;
                        });
                      })),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Description",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Amount",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
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
                margin:
                    EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 38,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.BORDER_COLOR,
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                              child: new Text(
                                "Clear",
                                style: TextStyle(
                                    color: COLOR.BLACK,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 38,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.SELECTED_COLOR,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.SELECTED_COLOR,
                              ),
                            ),
                            child: OutlineButton(
                              child: new Text(
                                "Submit",
                                style: TextStyle(
                                    color: COLOR.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ));
    Widget _agendaDetails = Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Agenda Details",
                style: FONT_CONST.BOLD_BLACK_14,
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Tour Agenda",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "IMP Business Appointment",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 1,
                  cursorColor: COLOR.PrimaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor, width: .5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: COLOR.textcolor),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Anticipated KRA of Tour Appointment",
                    hintStyle: FONT_CONST.REGULAR_HINT,
                  ),
                  style: FONT_CONST.REGULAR_BLACK1_13,
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
                margin:
                    EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 38,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.BORDER_COLOR,
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                              child: new Text(
                                "Clear",
                                style: TextStyle(
                                    color: COLOR.BLACK,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 38,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.SELECTED_COLOR,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.SELECTED_COLOR,
                              ),
                            ),
                            child: OutlineButton(
                              child: new Text(
                                "Submit",
                                style: TextStyle(
                                    color: COLOR.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ));
    Widget _myWidget = Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      padding: EdgeInsets.all(5.0),
      child: Card(
        elevation: 12,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/emp.png",
                  width: 70,
                  height: 70,
                  alignment: Alignment.bottomLeft,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text("0002 Mr. Sandip Patel",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          children: <Widget>[
                            Text("Applied on",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 12)),
                            SizedBox(
                              width: 20,
                              child: Icon(
                                Icons.date_range,
                                size: 16,
                              ),
                            ),
                            Text('02/12/2019',
                                style: TextStyle(
                                  color: Colors.orange[600],
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                      Text("Casual Leave",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: DefaultTabController(
                length: 4, // length of tabs
                initialIndex: 0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          labelStyle:  TextStyle(
                              fontWeight: FontWeight.w400,
                              color: COLOR.BLACK,fontSize: 10),
                          unselectedLabelStyle: FONT_CONST.REGULAR_HINT,
                          tabs: [
                            Tab(
                                icon: Icon(
                                  Icons.airplanemode_active,
                                  size: 18,
                                ),
                                text: "Travel Details"),
                            Tab(
                              icon: Icon(
                                Icons.directions_car,
                                size: 18,
                              ),
                              text: "Other Details",
                            ),
                            Tab(
                                icon: Icon(
                                  Icons.monetization_on,
                                  size: 18,
                                ),
                                text: "Advance Details"),
                            Tab(
                              icon: Icon(
                                Icons.description,
                                size: 18,
                              ),
                              text: "Agenda Details",
                            )
                          ]),
                    ),
                    Expanded(
                      child: Container(
                          //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            _travelDetail,
                            _otherDetail,
                            _advanceDetails,
                            _agendaDetails
                          ])),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 20),
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              leading: MediaQuery.removePadding(
                context: context,
                removeRight: true,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DashboardScreen()));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: COLOR.white,
                    size: 16,
                  ),
                ),
              ),
              title: new Text(
                "Travel Application",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: _myWidget,
          ),
        ],
      ),
    ));
  }
}
