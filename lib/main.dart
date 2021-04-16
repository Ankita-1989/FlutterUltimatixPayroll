import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_payrollapp/Constant/Constant.dart';
import 'package:flutter_payrollapp/Constant/PreferenceUtils.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_dashbord.dart';
import 'package:flutter_payrollapp/ui/sc_login.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configuration/Applocalization.dart';
import 'utils/COLOR.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getBool('isLoggedIn');
  print(email);
  runApp(MaterialApp(home: email == true ? DashboardScreen() : LoginScreen()));
  // runApp(MyApp());
}

String locale = Constant.ZH;
var selectedLanguage = 'English';
List<String> language = ['English', 'Chines'];
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: Constant.title,
      // locale: Locale(locale),
      home: SplashScreen(title: Constant.title),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   AppLocalizations.delegate
      // ],
      // supportedLocales: [
      //   const Locale('zh', ''), // Chinese
      //   const Locale('en', ''), // English
      // ],
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    PreferenceUtils.init();
    // TODO: implement initState
    super.initState();
    // Timer(
    //     Duration(seconds: 3),
    //         () async {
    //       // main();
    //       Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (BuildContext context) => LoginScreen()));
    //     });
  }
  @override
  Widget build(BuildContext context) {
    // Widget selectLanguage = Container(
    //     child: DropdownButton(
    //       isExpanded: false,
    //       underline: SizedBox(),
    //       value: selectedLanguage,
    //       items: language.map((String type) {
    //         return DropdownMenuItem<String>(
    //           value: type,
    //           child: Text(
    //             type,
    //             style: FONT_CONST.SEMIBOLD_BLACK,
    //           ),
    //         );
    //       }).toList(),
    //       onChanged: (String newValue) {
    //         setState(() {
    //           selectedLanguage = newValue;
    //           var lan = Graham.EN;
    //           if (selectedLanguage == 'English') {
    //             lan = Graham.EN;
    //           } else {
    //             lan = Graham.AR;
    //           }
    //
    //           print(lan);
    //           pref.setString(Graham.LAN, lan);
    //           Phoenix.rebirth(context);
    //         });
    //       },
    //     ).paddingLeft(Dimens.margin8))
    //     .paddingOnly(left: Dimens.margin16, right: Dimens.margin16);

    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [COLOR.SELECTED_COLOR, COLOR.MAIN_COLOR])),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image(
                height:70,
                width: 70,
                image: AssetImage("assets/images/logo.png"),
              ),),
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Ultimatix Payroll",
                  style: FONT_CONST.BOLD_WHITE_15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
