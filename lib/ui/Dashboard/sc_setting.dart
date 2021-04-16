import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_dashbord.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    Future<void> _launched;
    _launchURL(String toMailId, String subject, String body) async {
      var url = 'mailto:$toMailId?subject=$subject&body=$body';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Future<void> _makePhoneCall(String contact, bool direct) async {
      if (direct == true) {
        bool res = await FlutterPhoneDirectCaller.callNumber(contact);
      } else {
        String telScheme = 'tel:$contact';

        if (await canLaunch(telScheme)) {
          await launch(telScheme);
        } else {
          throw 'Could not launch $telScheme';
        }
      }
    }
    _launchwebURL() async {
      const url = 'http://orangetechnolab.net/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    Widget _mychild = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,

      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 2, top: 40),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DashboardScreen()));
                      },
                    ),
                    Text(
                      "Setting",
                      style: TextStyle(
                        color: COLOR.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Time Format",style: FONT_CONST.SEMIBOLD_BLACK_12,),
                    ),
                    new Spacer(),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Container(
                          width: 90,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: Container(
                              color: COLOR.trans,
                              height: 1,
                            ),
                            iconSize: 35,
                            style: FONT_CONST.REGULAR_HINT,
                            iconEnabledColor: COLOR.BLACK,
                            value: "12 hours",
                            items: <String>[
                              '12 hours',
                              '24 hours',
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (String newKey) {
                              setState(() {});
                            },
                          )),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Date Format",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Container(
                          width: 90,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: Container(
                              color: COLOR.trans,
                              height: 1,
                            ),
                            iconSize: 35,
                            style: FONT_CONST.REGULAR_HINT,
                            iconEnabledColor: COLOR.BLACK,
                            value: "22 April 2020",
                            items: <String>[
                              '22 April 2020',
                              '24 hours',
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (String newKey) {
                              setState(() {});
                            },
                          )),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Language",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Container(
                          width: 90,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: Container(
                              color: COLOR.trans,
                              height: 1,
                            ),
                            iconSize: 35,
                            style: FONT_CONST.REGULAR_HINT,
                            iconEnabledColor: COLOR.BLACK,
                            value: "English",
                            items: <String>[
                              'English',
                              'Gujarati',
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (String newKey) {
                              setState(() {});
                            },
                          )),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Camera",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Container(
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Colors.black,
                            activeColor: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Sound",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Container(
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Colors.black,
                            activeColor: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Geo Location",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Container(
                          width: 90,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: Container(
                              color: COLOR.trans,
                              height: 1,
                            ),
                            iconSize: 35,
                            style: FONT_CONST.REGULAR_HINT,
                            iconEnabledColor: COLOR.BLACK,
                            value: "Always Approve",
                            items: <String>[
                              'Always Approve',
                              'Never',
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (String newKey) {
                              setState(() {});
                            },
                          )),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Contact Us",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.call,
                        color: COLOR.BLACK,
                        size: 20,
                      ),
                      onPressed: () => setState(() {
                        _launched = _makePhoneCall('9714910602', true);
                      }),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.markunread,
                        color: COLOR.BLACK,
                        size: 20,
                      ),
                      onPressed: () => setState(() {
                        _launchURL('vinoth1094@gmail.com',
                            'Flutter Email Test', 'Hello Flutter');
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Website",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(
                              Icons.web,
                              color: COLOR.BLACK,
                              size: 20,
                            ),
                            onTap: (){
                              _launchwebURL();
                            },
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Change Password",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: COLOR.BLACK,
                            size: 20,
                          ),
                          onTap: (){
                          },
                        )
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Feedback",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: COLOR.BLACK,
                            size: 20,
                          ),
                          onTap: (){
                          },
                        )
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 10),
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
                    border: Border.all(width: 1, color: Colors.transparent)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Version",style: FONT_CONST.SEMIBOLD_BLACK_12),
                    ),
                    new Spacer(),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("10.3",style: FONT_CONST.REGULAR_BLACK1_12),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      body: _mychild,
    );
  }
}
