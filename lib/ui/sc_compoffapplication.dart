import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

class CompOffApplication extends StatefulWidget {
  @override
  _CompOffApplicationState createState() => _CompOffApplicationState();
}

DateTime selectedDate = DateTime.now();
TextEditingController _date = new TextEditingController();

class _CompOffApplicationState extends State<CompOffApplication> {
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: picked.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _myWidget = Container(
        margin: EdgeInsets.only(left: 12, right: 12, top: 5),
        child: Card(
          elevation: 12.0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    'Extra Work Date',
                    style: FONT_CONST.SEMIBOLD_BLACK_12,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _date,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            hintText: '19/02/2021',
                            hintStyle: FONT_CONST.REGULAR_HINT),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10,top: 5),
                  child: Text(
                    'Extra work Hours',
                    style: FONT_CONST.SEMIBOLD_BLACK_12,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 9),
                  child: TextFormField(
                    maxLines: 1,
                    cursorColor: COLOR.PrimaryColor,
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
                      hintText: "01:09",
                      hintStyle: FONT_CONST.REGULAR_HINT,
                    ),
                    style: FONT_CONST.REGULAR_BLACK1_13,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Text(
                    'Comp-Off days',
                    style: FONT_CONST.SEMIBOLD_BLACK_12,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 9),
                  child: TextFormField(
                    maxLines: 1,
                    cursorColor: COLOR.PrimaryColor,
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
                      hintText: "1.5",
                      hintStyle: FONT_CONST.REGULAR_HINT,
                    ),
                    style: FONT_CONST.REGULAR_BLACK1_13,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Text(
                    'Extra work Reason',
                    style: FONT_CONST.SEMIBOLD_BLACK_12,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 9),
                  child: TextFormField(
                    maxLines: 1,
                    cursorColor: COLOR.PrimaryColor,
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
                      hintText: "Reason",
                      hintStyle: FONT_CONST.REGULAR_HINT,
                    ),
                    style: FONT_CONST.REGULAR_BLACK1_13,
                  ),
                ),

                Container(
                    width: double.infinity,
                    height: 43,
                    margin: EdgeInsets.only(
                        right: 30, top: 20, left: 30, bottom: 10),
                    decoration: BoxDecoration(
                      color: COLOR.SELECTED_COLOR,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: COLOR.SELECTED_COLOR,
                        width: 1,
                      ),
                    ),
                    child: OutlineButton(
                        child: new Text(
                          "Submit",
                          style: TextStyle(color: COLOR.white, fontSize: 12),
                        ),
                        onPressed: null,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))))
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
                leading: MediaQuery.removePadding(
                  context: context,
                  removeRight: true,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: COLOR.white,
                      size: 16,
                    ),
                  ),
                ),
                title: new Text(
                  "Comp-Off Request",
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
