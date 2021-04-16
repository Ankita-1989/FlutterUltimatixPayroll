import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  var value = 'Education Certificate';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  // List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  // FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  // void _openFileExplorer() async {
  //   setState(() => _loadingPath = true);
  //   try {
  //     _directoryPath = null;
  //     _paths = (await FilePicker.platform.pickFiles(
  //       type: _pickingType,
  //       allowMultiple: _multiPick,
  //       allowedExtensions: (_extension?.isNotEmpty ?? false)
  //           ? _extension?.replaceAll(' ', '')?.split(',')
  //           : null,
  //     ))
  //         ?.files;
  //   } on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   } catch (ex) {
  //     print(ex);
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     _loadingPath = false;
  //     _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Widget _myWidget = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,

      child: Container(
        margin: EdgeInsets.only(left: 8, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //change here don't //worked
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: COLOR.white,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      "Upload Documents",
                      style: TextStyle(
                        color: COLOR.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, top: 20, right: 8),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Card(
                        margin: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        color: COLOR.white,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Select Documents",
                                      style: FONT_CONST.BOLD_BLACK_16,
                                    ),
                                    margin: EdgeInsets.only(
                                      left: 2,
                                      top: 10,
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
                                          iconEnabledColor: COLOR.BLACK,
                                          value: value,
                                          items: <String>[
                                            'Education Certificate',
                                            'Achievement Certificate',
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
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10, right: 10),
                              child: Row(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Attach Document',
                                      style: FONT_CONST.SEMIBOLD_BLACK_13,
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      child: Icon(
                                        Icons.attachment,
                                        color: COLOR.BLACK,
                                        size: 18,
                                      ),
                                      onTap: () {
                                        // _openFileExplorer();
                                      },
                                    ),
                                  ),
                                ],
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
                                      "Filter",
                                      style: TextStyle(
                                          color: COLOR.white, fontSize: 16),
                                    ),
                                    onPressed: null,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0))))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
