class LoginModel {
  bool status;
  String msg;
  List<Data> data;
  String token;

  LoginModel({this.status, this.msg, this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  int loginID;
  String loginName;
  int cmpID;
  int empID;
  String alphaEmpCode;
  String empFullName;
  String empLeft;
  String imageName;
  String deptName;
  String desigName;
  String loginDate;
  int isGeofenceEnable;
  int isCameraEnable;
  String cmpLogo;
  int isRoute;
  int isVertical;
  int isMobileWorkplanEnable;
  int isMobileStockEnable;
  int isVBA;
  int storeID;
  String storeName;

  Data(
      {this.loginID,
      this.loginName,
      this.cmpID,
      this.empID,
      this.alphaEmpCode,
      this.empFullName,
      this.empLeft,
      this.imageName,
      this.deptName,
      this.desigName,
      this.loginDate,
      this.isGeofenceEnable,
      this.isCameraEnable,
      this.cmpLogo,
      this.isRoute,
      this.isVertical,
      this.isMobileWorkplanEnable,
      this.isMobileStockEnable,
      this.isVBA,
      this.storeID,
      this.storeName});

  Data.fromJson(Map<String, dynamic> json) {
    loginID = json['Login_ID'];
    loginName = json['Login_Name'];
    cmpID = json['Cmp_ID'];
    empID = json['Emp_ID'];
    alphaEmpCode = json['Alpha_Emp_Code'];
    empFullName = json['Emp_Full_Name'];
    empLeft = json['Emp_Left'];
    imageName = json['Image_Name'];
    deptName = json['Dept_Name'];
    desigName = json['Desig_Name'];
    loginDate = json['LoginDate'];
    isGeofenceEnable = json['Is_Geofence_enable'];
    isCameraEnable = json['Is_Camera_enable'];
    cmpLogo = json['Cmp_Logo'];
    isRoute = json['Is_Route'];
    isVertical = json['IsVertical'];
    isMobileWorkplanEnable = json['Is_MobileWorkplan_Enable'];
    isMobileStockEnable = json['Is_MobileStock_Enable'];
    isVBA = json['Is_VBA'];
    storeID = json['Store_ID'];
    storeName = json['Store_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Login_ID'] = this.loginID;
    data['Login_Name'] = this.loginName;
    data['Cmp_ID'] = this.cmpID;
    data['Emp_ID'] = this.empID;
    data['Alpha_Emp_Code'] = this.alphaEmpCode;
    data['Emp_Full_Name'] = this.empFullName;
    data['Emp_Left'] = this.empLeft;
    data['Image_Name'] = this.imageName;
    data['Dept_Name'] = this.deptName;
    data['Desig_Name'] = this.desigName;
    data['LoginDate'] = this.loginDate;
    data['Is_Geofence_enable'] = this.isGeofenceEnable;
    data['Is_Camera_enable'] = this.isCameraEnable;
    data['Cmp_Logo'] = this.cmpLogo;
    data['Is_Route'] = this.isRoute;
    data['IsVertical'] = this.isVertical;
    data['Is_MobileWorkplan_Enable'] = this.isMobileWorkplanEnable;
    data['Is_MobileStock_Enable'] = this.isMobileStockEnable;
    data['Is_VBA'] = this.isVBA;
    data['Store_ID'] = this.storeID;
    data['Store_Name'] = this.storeName;
    return data;
  }
}
