import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';

import '../utils/COLOR.dart';
import '../utils/FONT_CONST.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      color: COLOR.white,
                      onPressed: () {
                        //hide keyboardd
                        FocusManager.instance.primaryFocus.unfocus();
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: COLOR.white,
                        fontSize: 18,
                      ),
                    ),
                    new Spacer(),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.check,
                          color: COLOR.white,
                          size: 18,
                        )),
                  ],
                ),
              ),
              Card(
                color: COLOR.white,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Personal Address",
                            style: FONT_CONST.SEMIBOLD_BLACK_14,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(top: 10),
                        color: COLOR.textcolor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Kataria Arcade',
                              hintStyle: FONT_CONST.REGULAR_HINT),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "City",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Ahmadabad',
                              hintStyle: FONT_CONST.REGULAR_HINT),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Select State",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Gujarat',
                              hintStyle: FONT_CONST.REGULAR_HINT),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Pincode",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: '380016',
                              hintStyle: FONT_CONST.REGULAR_HINT),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  color: COLOR.white,
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Contact",
                            style: FONT_CONST.SEMIBOLD_BLACK_14,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(top: 10),
                        color: COLOR.textcolor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Mobile Number",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: '9987456123',
                              hintStyle: FONT_CONST.REGULAR_HINT),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Landline",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: '9874563210',
                              hintStyle: FONT_CONST.REGULAR_HINT),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Alternate Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'prakasg@gmail.com',
                              hintStyle: FONT_CONST.REGULAR_HINT),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      body: _myWidget,
    );
  }
}
