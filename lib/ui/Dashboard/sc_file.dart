import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/list/filelist.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_dashbord.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';

import '../sc_fileupload.dart';

class FileScreen extends StatefulWidget {
  @override
  _FileScreenState createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  @override
  Widget build(BuildContext context) {
    var itemCount = 5;
    Widget _myWidget = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
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
                    "Files",
                    style: TextStyle(
                      color: COLOR.white,
                      fontSize: 18,
                    ),
                  ),
                  new Spacer(),
                  InkWell(
                    child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.add,
                          size: 28,
                          color: COLOR.white,
                        )),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              FileUploadScreen()));
                    },
                  )
                ],
              ),
            ),
            Flexible(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: itemCount > 0
                    ? ListView.builder(
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          return filelist(context, index);
                        },
                      )
                    : Center(child: const Text('No items')),
              ),
            )
          ],
        ),
      ),
    );
    return Scaffold(body: _myWidget);
  }
}
