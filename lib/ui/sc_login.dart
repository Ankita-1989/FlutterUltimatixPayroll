import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/Constant/Constant.dart';
import 'package:flutter_payrollapp/Constant/PreferenceUtils.dart';
import 'package:flutter_payrollapp/api_repository/api.dart';
import 'package:flutter_payrollapp/response_model/loginmodel.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard/sc_dashbord.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myController = TextEditingController();
  final _userController = TextEditingController();

  final _passController = TextEditingController();
  bool _isProgress = false;

  List data;

  var _validate1 = false;

  Future<String> getServerConnetion(Map<String, String> body) async {
    // ignore: unnecessary_statements
    var response = await http.post(
        "http://192.168.1.197:8032/Api/Home/ServerConnection",
        headers: {"Accept": "application/json"},
        body: body);

    setState(() {
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        print(res);
        if (res['status'] == true) {
          myController.text = '';
          Navigator.pop(context);
          FocusScope.of(context).requestFocus(new FocusNode());
          openDialog(res['msg']);
          var data = res['data']['webServiceLink'];
          PreferenceUtils.setString('weblink', data);
          print(PreferenceUtils.getString('weblink'));
        } else {
          myController.text = '';
          openDialog(res['msg']);
        }
      }
    });
    // return ServerConnection.fromJson(jsonDecode(response.body));
    return "Success";
  }

  _validate() {
    if (_userController.text.trim().isEmpty) {
      print("Please Enter Email");
    } else if (_passController.text.trim().isEmpty) {
      print("Please Enter Password");
    } else {
      _loginApiCall(_userController.text, _passController.text, "", null, "");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PreferenceUtils.init();
  }

  @override
  Widget build(BuildContext context) {
    _userController.text = "a0003@ota";
    _passController.text = "m5o0t5";
    final _formKey = GlobalKey<FormState>();
    Widget _myWidget = Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 70,
                height: 80,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  "Login to your Ultimatix App",
                  style: FONT_CONST.BOLD_WHITE_15,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formKey,
                child: Card(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  color: COLOR.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userController,
                          decoration: InputDecoration(
                            hintText: 'Enter Username',
                            hintStyle:
                                TextStyle(color: COLOR.textcolor, fontSize: 12),
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: COLOR.BLACK, fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: COLOR.textcolor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          controller: _passController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            hintStyle:
                                TextStyle(color: COLOR.textcolor, fontSize: 12),
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: COLOR.BLACK, fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: COLOR.textcolor),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: COLOR.BLACK,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, left: 15, right: 15, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 46,
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
                                          "Server Connection",
                                          style: TextStyle(
                                              color: COLOR.BLACK, fontSize: 12),
                                        ),
                                        onPressed: () {
                                          showdialog();
                                        },
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0))))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 46,
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
                                          "Login",
                                          style: TextStyle(
                                              color: COLOR.white, fontSize: 12),
                                        ),
                                        onPressed: () {
                                          _validate();
                                        },
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0))))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 50,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  "Powered By Orange Technolab Pvt Ltd",
                  style: TextStyle(color: COLOR.BLACK, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ModalProgressHUD(
          inAsyncCall: _isProgress,
          child: Container(
            decoration: CommonMethod.baseBackgroundDecoration,
            child: _myWidget,
          ),
        ));
  }

  void showdialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              "Server Connection",
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
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Please Enter Server Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: 'Demo',
                        errorText: _validate1 ? 'Value Can\'t Be Empty' : null,
                      ),
                    ),
                  ),
                  Container(
                      height: 46,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          left: 18, right: 18, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: COLOR.SELECTED_COLOR,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: COLOR.SELECTED_COLOR,
                        ),
                      ),
                      child: OutlineButton(
                          child: new Text(
                            "Connect",
                            style: TextStyle(color: COLOR.white),
                          ),
                          onPressed: () {
                            if (!myController.text.isEmpty) {
                              print(myController.text);
                              final body = {
                                'code': myController.text,
                                'type': '',
                              };
                              var serverconnection = getServerConnetion(body);
                              print(serverconnection);
                              // prefs.setString("applink", serverconnection);

                            } else {
                              openDialog("Enter Server name.");
                            }
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))))
                ],
              ),
            ),
          );
        });
  }

  void openDialog(String msg) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: msg),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF303F9F),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  _loginApiCall(String text, String text2, String s, param3, String t) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        FocusScope.of(context).requestFocus(FocusNode());
        _isProgress = true;
      });
      // String appbaseUrl = PreferenceUtils.getString('weblink');
      // print(appbaseUrl);

      /*----------API url----------------*/
      // String url = appbaseUrl+Constant.Login;

      String url = Constant.LOGIN;

      print(url);

      /*----------API Body----------------*/
      var mBody;
      mBody = {
        "userName": _userController.text.toString(),
        "password": _passController.text.toString(),
        "imeiNo": "",
        "deviceID": ""
      };
      String response = await postRequest(url, mBody);
      // /*-------------------Api Response-------------*/
      LoginModel loginModel = LoginModel.fromJson(json.decode(response));
      // ignore: unrelated_type_equality_checks
      if (loginModel.status.toString() == "true") {
        print(loginModel.token);
        PreferenceUtils.setString("Bearer", loginModel.token);
        List<Data> data=loginModel.data;
        PreferenceUtils.setString("EmpId", data[0].empID.toString());
        PreferenceUtils.setString("CmpId", data[0].cmpID.toString());
        PreferenceUtils.setString("EmpCode", data[0].alphaEmpCode.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => DashboardScreen()));
      } else {
        setState(() {
          _isProgress = false;
        });
        if (loginModel.msg != null && loginModel.msg.isNotEmpty) {
          print(loginModel.msg);
        }
      }
    } else {
      print("No internet connection");
    }
  }
}
