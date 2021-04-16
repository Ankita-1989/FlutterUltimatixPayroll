import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/Constant/Constant.dart';
import 'package:flutter_payrollapp/Constant/PreferenceUtils.dart';
import 'package:flutter_payrollapp/api_repository/api.dart';
import 'package:flutter_payrollapp/response_model/dashboard.dart';
import 'package:flutter_payrollapp/response_model/employeedetail.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_file.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_helpcenter.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_setting.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_ticket.dart';
import 'package:flutter_payrollapp/ui/sc_travelapplication.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

import 'file:///E:/NafisaAndroid_Projects/FlutterPayroll/flutter_payrollapp/lib/ui/Dashboard/sc_approval.dart';
import 'file:///E:/NafisaAndroid_Projects/FlutterPayroll/flutter_payrollapp/lib/ui/Dashboard/sc_attendance.dart';
import 'file:///E:/NafisaAndroid_Projects/FlutterPayroll/flutter_payrollapp/lib/ui/Dashboard/sc_holiday.dart';
import 'file:///E:/NafisaAndroid_Projects/FlutterPayroll/flutter_payrollapp/lib/ui/Dashboard/sc_salary.dart';

import '../../utils/COLOR.dart';
import '../Leave/sc_leave.dart';
import 'sc_clocking.dart';
import 'sc_home.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int i = 1;

  bool _isProgress = false;

  bool _isShowHome = true;

  List<Widget> _buildDrawerList(BuildContext context) {
    List<Widget> children = [];
    if (i == 1) children.add(HomeScreen());
    if (i == 1) children.add(ClockingScreen());
    if (i == 1) children.add(Attendance());
    return children;
  }

  List<Widget> _widgetOptions = [
    HomeScreen(),
    ClockingScreen(),
    Attendance(),
    Container(),
    LeaveScreen(),
    ApprovalScreen(),
    Holiday(),
    LeaveScreen(),
    TicketScreen(),
    HelpCenterScreen(),
    HelpCenterScreen(),
    SalaryScreen(),
    FileScreen(),
    TravelApplicationScreen(),
    SettingScreen(),
  ];
  int _currentSelected = 0;
  int _currentPageSelected = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void _onItemTapped(int index) {
    setState(() {
      if (index == 3) {
        _drawerKey.currentState.openEndDrawer();
        // _currentSelected = index;
      } else {
        if (index < 4) {
          _currentSelected = index;
        }
        _isShowHome = false;
        _currentPageSelected = index;
      }
    });
  }


  void _dashboardApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        FocusScope.of(context).requestFocus(FocusNode());
        _isProgress = true;
      });

      /*----------API url----------------*/
      var customBody = Constant.DASHBOARD +
          "EmpID=" +
          PreferenceUtils.getString("EmpId") +
          "&CmpID=" +
          PreferenceUtils.getString("CmpId");

      print(customBody);

      /*----------API Body----------------*/

      String response = await callGetMethod(context, customBody);
      /*----------API Response----------------*/
      DashboardModel streams = DashboardModel.fromJson(json.decode(response));
      if (streams.status == true) {

        setState(() {
          _isProgress = false;
        });
      } else {
        setState(() {
          _isProgress = false;
        });
        // if (streams != null && streams.msg.isNotEmpty) {
        // }
      }
    } else {}
  }

  void _employeeApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        FocusScope.of(context).requestFocus(FocusNode());
        _isProgress = true;
      });

      /*----------API url----------------*/
      var customBody = Constant.EMPLOYEEDETAILS +
          "EmpID=" +
          PreferenceUtils.getString("EmpId") +
          "&CmpID=" +
          PreferenceUtils.getString("CmpId") +
          "&EmpCode=" +
          PreferenceUtils.getString("EmpCode");

      print(customBody);

      /*----------API Body----------------*/
      String response = await callGetMethod(context, customBody);
      /*----------API Response----------------*/
      EmployeeDetailModel streams =
          EmployeeDetailModel.fromJson(json.decode(response));

      if (streams.status == true) {
        PreferenceUtils.setString("EmployeeData", json.encode(streams.data[0]));
        setState(() {
          _isProgress = false;
        });
      } else {
        setState(() {
          _isProgress = false;
        });
        // if (streams != null && streams.msg.isNotEmpty) {
        // }
      }
    } else {}
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    // TODO: implement initState
    PreferenceUtils.init();
    super.initState();
    _dashboardApi();
    _employeeApi();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _drawerKey,
        body: Container(
          height: double.infinity,
          decoration: CommonMethod.baseBackgroundDecoration,
          child: _widgetOptions.elementAt(_currentPageSelected),
        ),
        endDrawer: Drawer(
            child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Visibility(
              visible: false,
              child: ListTile(
                title: Text(
                  'Home',
                  style: FONT_CONST.REGULAR_BLACK1_14,
                ),
                leading: Icon(
                  Icons.home,
                  color: COLOR.BLACK,
                ),
                onTap: () {
                  _onItemTapped(0);
                  Navigator.of(context).pop();
                },
              ),
            ),
            // Divider(),
            Visibility(
              visible: false,
              child: ListTile(
                title: Text(
                  'Clocking',
                  style: FONT_CONST.REGULAR_BLACK1_14,
                ),
                leading: ImageIcon(
                  AssetImage("assets/images/geolocation.png"),
                  color: COLOR.BLACK,
                ),
                onTap: () {
                  _onItemTapped(1);
                  Navigator.of(context).pop();
                },
              ),
            ),
            // Divider(),
            Visibility(
              visible: false,
              child: ListTile(
                title: Text(
                  'Attendance',
                  style: FONT_CONST.REGULAR_BLACK1_14,
                ),
                leading: ImageIcon(
                  AssetImage("assets/images/attendance.png"),
                  color: COLOR.BLACK,
                ),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.of(context).pop();
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Leave',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/leave.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(4);
                Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => LeaveScreen()));
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Approvals',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/approval.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(5);
                Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => ApprovalScreen()));
                //                  Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Holidays',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/holiday_icon.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(6);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'HelpDesk',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/helpdesk.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(7);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Ticket Application',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/ic_ticket.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(8);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Birthday & Anniversary',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/events.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(9);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Help Center',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/events.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(10);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Salary',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/salary.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(11);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Files',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: Icon(
                Icons.insert_drive_file,
              ),
              onTap: () {
                _onItemTapped(12);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Travel',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: Icon(
                Icons.insert_drive_file,
              ),
              onTap: () {
                _onItemTapped(13);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Settings',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: ImageIcon(
                AssetImage("assets/images/settings.png"),
                color: COLOR.BLACK,
              ),
              onTap: () {
                _onItemTapped(14);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Sign out',
                style: FONT_CONST.REGULAR_BLACK1_14,
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: COLOR.BLACK,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Are you sure you want to exit?'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    });
              },
            ),
            Divider(),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _currentSelected,
          showUnselectedLabels: true,
          unselectedItemColor: COLOR.BLACK,
          selectedItemColor: COLOR.SELECTED_COLOR,
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text(
                'Home',
                style: FONT_CONST.REGULAR_BLACK1_13,
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.location_on),
              title: new Text(
                'Clocking',
                style: FONT_CONST.REGULAR_BLACK1_13,
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                title: Text(
                  'Attendance',
                  style: FONT_CONST.REGULAR_BLACK1_13,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_vert),
                title: Text(
                  'More',
                  style: FONT_CONST.REGULAR_BLACK1_13,
                ))
          ],
        ),
      ),
    );
  }

//   Future<bool> _systemBackButtonPressed(BuildContext context) {
//     if (!_isShowHome) {
//       setState(() {
//         _isShowHome = !_isShowHome;
//       });
//     } else {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) => _exitDialog(context)) ??
//           false;
// //    exit(0);
//     }
}
