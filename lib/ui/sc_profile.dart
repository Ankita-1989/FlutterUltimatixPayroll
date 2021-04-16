import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_payrollapp/Constant/PreferenceUtils.dart';
import 'package:flutter_payrollapp/commonWidget/menu_item.dart';
import 'package:flutter_payrollapp/response_model/employeedetail.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/COLOR.dart';
import '../utils/FONT_CONST.dart';
import 'sc_editprofile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File _image;
  final picker = ImagePicker();
  EmpData usermodel;

  Future getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);

    try {
      setState(() {
        _image = image;
        print("=======================$_image ");
      });
    } catch (e) {
      setState(() {
        print(e);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usermodel = EmpData.fromJson(
        json.decode(PreferenceUtils.getString("EmployeeData")));
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
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //change here don't //worked
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      color: COLOR.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: COLOR.white,
                        fontSize: 18,
                      ),
                    ),
                    new Spacer(),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top:10,left: 20),
                    width: double.infinity,
                    child: Card(
                      color: COLOR.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 2, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //change here don't //worked
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      usermodel.empFullNameNew,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: COLOR.BLACK,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: _image == null
                        ? Container(
                            width: 70,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: COLOR.white),
                              image: DecorationImage(
                                  image: NetworkImage(usermodel.imageName),
                                  fit: BoxFit.fill),
                            ))
                        : Container(
                            width: 70,
                            height: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: COLOR.white),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(_image))),
                          ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 50, top: 45),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: COLOR.white,
                        child: IconButton(
                          alignment: Alignment.center,
                          color: COLOR.SELECTED_COLOR,
                          iconSize: 16,
                          icon: Icon(
                            Icons.edit,
                          ),
                          onPressed: () {
                            showdialog();
                          },
                        ),
                      ))
                ],
              ),
              Container(
                width: double.infinity,
                child: Card(
                  color: COLOR.white,
                  margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Personal Information",
                            style: FONT_CONST.SEMIBOLD_BLACK_14,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(top: 10),
                        color: COLOR.textcolor,
                      ),
                      MenuItem(
                        title: "Employee Code",
                        title1: usermodel.empCode,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      MenuItem(
                        title: "Date of Joining",
                        title1: usermodel.dateOfJoin,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      MenuItem(
                        title: "Blood Group",
                        title1: usermodel.bloodGroup,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      MenuItem(
                        title: "UAN Number",
                        title1: usermodel.uANNo,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      MenuItem(
                        title: "Adhar card Number",
                        title1: usermodel.aadharCardNo,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  color: COLOR.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Present Address",
                                style: FONT_CONST.SEMIBOLD_BLACK_14,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        EditProfileScreen()));
                              },
                              child: Icon(
                                Icons.edit,
                                color: COLOR.SELECTED_COLOR,
                                size: 18,
                              ),
                           ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 3),
                        child:Padding(
                          padding: EdgeInsets.only(top:5,left: 3,right: 3),
                          child:  Text(
                           usermodel.street1+","+usermodel.city+","+usermodel.state+","+usermodel.zipCode,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: COLOR.BLACK,
                            ),
                          ),
                        )
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        height: 1,
                        color: COLOR.textcolor,
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
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Contact",
                                style: FONT_CONST.SEMIBOLD_BLACK_14,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditProfileScreen()));
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 16,
                                  color: COLOR.SELECTED_COLOR,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(top: 10),
                        color: COLOR.textcolor,
                      ),
                      MenuItem(
                        title: "Mobile Number",
                        title1: usermodel.mobileNo,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      MenuItem(
                        title: "Landline",
                        title1: usermodel.mobileNo1,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      MenuItem(
                        title: "Alternate Email",
                        title1: usermodel.otherEmail,
                      ),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
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

  void showdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.topCenter,
                              colors: [COLOR.SELECTED_COLOR, COLOR.MAIN_COLOR]),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                          ),
                          border:
                              Border.all(width: 3, color: Colors.transparent)),
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Change Profile Photo",
                              style: FONT_CONST.REGULAR_WHITE_18,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            color: COLOR.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 16,
                            ),
                          ),
                        ],
                      )),
                  InkWell(
                    child: MenuItem(
                      title: "New Profile Photo",
                      title1: "",
                    ),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    height: 1,
                    color: COLOR.textcolor,
                  ),
                  InkWell(
                    child: MenuItem(
                      title: "Import From Gallery",
                      title1: "",
                    ),
                    onTap: () {
                      getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    height: 1,
                    color: COLOR.textcolor,
                  ),
                  InkWell(
                    child: MenuItem(
                      title: "Remove Profile Photo",
                      title1: "",
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        });
  }
}
