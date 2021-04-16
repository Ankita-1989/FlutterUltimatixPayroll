class DashboardModel {
  bool status;
  String msg;
  List<Data> data;
  List<Data1> data1;

  DashboardModel({this.status, this.msg, this.data, this.data1});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    if (json['data1'] != null) {
      data1 = new List<Data1>();
      json['data1'].forEach((v) {
        data1.add(new Data1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.data1 != null) {
      data['data1'] = this.data1.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int empId;
  int cmpID;
  int branchID;
  String forDate;
  String status;
  String leaveCode;
  double leaveCount;
  String oD;
  double oDCount;
  String wOHO;
  String status2;
  int rowID;
  String inDate;
  String outDate;
  int shiftId;
  String shiftName;
  String shInTime;
  String shOutTime;
  String holiday;
  String lateLimit;
  String reason;
  String halfFullDay;
  String chkBySuperior;
  String supComment;
  int isCancelLateIn;
  int isCancelEarlyOut;
  String earlyLimit;
  String mainStatus;
  String detailStatus;
  int isLateCalcOnHOWO;
  int isEarlyCalcOnHOWO;
  int lateMinute;
  int earlyMinute;
  int isLeaveApp;
  String otherReason;
  int rEmpID;
  String dateOfJoin;
  String leftDate;
  int lateTime;
  int earlyTime;
  int lateMinutes;
  int earlyOut;
  String alphaEmpCode;
  String empFullName;
  String branchName;
  String deptName;
  String grdName;
  String desigName;
  String branchAddress;
  String compName;
  String dBRDCode;
  double pDays;
  int empLateMark;
  int empEarlyMark;
  String disableComment;
  int grdID;
  int rEmpID1;

  Data(
      {this.empId,
        this.cmpID,
        this.branchID,
        this.forDate,
        this.status,
        this.leaveCode,
        this.leaveCount,
        this.oD,
        this.oDCount,
        this.wOHO,
        this.status2,
        this.rowID,
        this.inDate,
        this.outDate,
        this.shiftId,
        this.shiftName,
        this.shInTime,
        this.shOutTime,
        this.holiday,
        this.lateLimit,
        this.reason,
        this.halfFullDay,
        this.chkBySuperior,
        this.supComment,
        this.isCancelLateIn,
        this.isCancelEarlyOut,
        this.earlyLimit,
        this.mainStatus,
        this.detailStatus,
        this.isLateCalcOnHOWO,
        this.isEarlyCalcOnHOWO,
        this.lateMinute,
        this.earlyMinute,
        this.isLeaveApp,
        this.otherReason,
        this.rEmpID,
        this.dateOfJoin,
        this.leftDate,
        this.lateTime,
        this.earlyTime,
        this.lateMinutes,
        this.earlyOut,
        this.alphaEmpCode,
        this.empFullName,
        this.branchName,
        this.deptName,
        this.grdName,
        this.desigName,
        this.branchAddress,
        this.compName,
        this.dBRDCode,
        this.pDays,
        this.empLateMark,
        this.empEarlyMark,
        this.disableComment,
        this.grdID,
        this.rEmpID1});

  Data.fromJson(Map<String, dynamic> json) {
    empId = json['Emp_Id'];
    cmpID = json['Cmp_ID'];
    branchID = json['branch_ID'];
    forDate = json['For_Date'];
    status = json['Status'];
    leaveCode = json['Leave_code'];
    leaveCount = json['Leave_Count'];
    oD = json['OD'];
    oDCount = json['OD_Count'];
    wOHO = json['WO_HO'];
    status2 = json['Status_2'];
    rowID = json['Row_ID'];
    inDate = json['In_Date'];
    outDate = json['Out_Date'];
    shiftId = json['shift_id'];
    shiftName = json['shift_name'];
    shInTime = json['sh_in_time'];
    shOutTime = json['sh_out_time'];
    holiday = json['holiday'];
    lateLimit = json['late_limit'];
    reason = json['Reason'];
    halfFullDay = json['Half_Full_Day'];
    chkBySuperior = json['Chk_By_Superior'];
    supComment = json['Sup_Comment'];
    isCancelLateIn = json['Is_Cancel_Late_In'];
    isCancelEarlyOut = json['Is_Cancel_Early_Out'];
    earlyLimit = json['Early_Limit'];
    mainStatus = json['Main_Status'];
    detailStatus = json['Detail_Status'];
    isLateCalcOnHOWO = json['Is_Late_Calc_On_HO_WO'];
    isEarlyCalcOnHOWO = json['Is_Early_Calc_On_HO_WO'];
    lateMinute = json['late_minute'];
    earlyMinute = json['Early_minute'];
    isLeaveApp = json['Is_Leave_App'];
    otherReason = json['Other_Reason'];
    rEmpID = json['R_Emp_ID'];
    dateOfJoin = json['Date_of_join'];
    leftDate = json['Left_date'];
    lateTime = json['late_time'];
    earlyTime = json['early_time'];
    lateMinutes = json['late_minutes'];
    earlyOut = json['early_out'];
    alphaEmpCode = json['Alpha_Emp_Code'];
    empFullName = json['Emp_full_Name'];
    branchName = json['Branch_Name'];
    deptName = json['Dept_Name'];
    grdName = json['Grd_Name'];
    desigName = json['Desig_Name'];
    branchAddress = json['Branch_Address'];
    compName = json['Comp_Name'];
    dBRDCode = json['DBRD_Code'];
    pDays = json['P_days'];
    empLateMark = json['Emp_Late_mark'];
    empEarlyMark = json['Emp_Early_mark'];
    disableComment = json['Disable_Comment'];
    grdID = json['Grd_ID'];
    rEmpID1 = json['R_Emp_ID1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Emp_Id'] = this.empId;
    data['Cmp_ID'] = this.cmpID;
    data['branch_ID'] = this.branchID;
    data['For_Date'] = this.forDate;
    data['Status'] = this.status;
    data['Leave_code'] = this.leaveCode;
    data['Leave_Count'] = this.leaveCount;
    data['OD'] = this.oD;
    data['OD_Count'] = this.oDCount;
    data['WO_HO'] = this.wOHO;
    data['Status_2'] = this.status2;
    data['Row_ID'] = this.rowID;
    data['In_Date'] = this.inDate;
    data['Out_Date'] = this.outDate;
    data['shift_id'] = this.shiftId;
    data['shift_name'] = this.shiftName;
    data['sh_in_time'] = this.shInTime;
    data['sh_out_time'] = this.shOutTime;
    data['holiday'] = this.holiday;
    data['late_limit'] = this.lateLimit;
    data['Reason'] = this.reason;
    data['Half_Full_Day'] = this.halfFullDay;
    data['Chk_By_Superior'] = this.chkBySuperior;
    data['Sup_Comment'] = this.supComment;
    data['Is_Cancel_Late_In'] = this.isCancelLateIn;
    data['Is_Cancel_Early_Out'] = this.isCancelEarlyOut;
    data['Early_Limit'] = this.earlyLimit;
    data['Main_Status'] = this.mainStatus;
    data['Detail_Status'] = this.detailStatus;
    data['Is_Late_Calc_On_HO_WO'] = this.isLateCalcOnHOWO;
    data['Is_Early_Calc_On_HO_WO'] = this.isEarlyCalcOnHOWO;
    data['late_minute'] = this.lateMinute;
    data['Early_minute'] = this.earlyMinute;
    data['Is_Leave_App'] = this.isLeaveApp;
    data['Other_Reason'] = this.otherReason;
    data['R_Emp_ID'] = this.rEmpID;
    data['Date_of_join'] = this.dateOfJoin;
    data['Left_date'] = this.leftDate;
    data['late_time'] = this.lateTime;
    data['early_time'] = this.earlyTime;
    data['late_minutes'] = this.lateMinutes;
    data['early_out'] = this.earlyOut;
    data['Alpha_Emp_Code'] = this.alphaEmpCode;
    data['Emp_full_Name'] = this.empFullName;
    data['Branch_Name'] = this.branchName;
    data['Dept_Name'] = this.deptName;
    data['Grd_Name'] = this.grdName;
    data['Desig_Name'] = this.desigName;
    data['Branch_Address'] = this.branchAddress;
    data['Comp_Name'] = this.compName;
    data['DBRD_Code'] = this.dBRDCode;
    data['P_days'] = this.pDays;
    data['Emp_Late_mark'] = this.empLateMark;
    data['Emp_Early_mark'] = this.empEarlyMark;
    data['Disable_Comment'] = this.disableComment;
    data['Grd_ID'] = this.grdID;
    data['R_Emp_ID1'] = this.rEmpID1;
    return data;
  }
}

class Data1 {
  int empId;
  double present;
  double wO;
  double hO;
  double oD;
  double absent;
  double leave;
  double total;
  double dPresent;

  Data1(
      {this.empId,
        this.present,
        this.wO,
        this.hO,
        this.oD,
        this.absent,
        this.leave,
        this.total,
        this.dPresent});

  Data1.fromJson(Map<String, dynamic> json) {
    empId = json['emp_id'];
    present = json['Present'];
    wO = json['WO'];
    hO = json['HO'];
    oD = json['OD'];
    absent = json['Absent'];
    leave = json['Leave'];
    total = json['Total'];
    dPresent = json['D_Present'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_id'] = this.empId;
    data['Present'] = this.present;
    data['WO'] = this.wO;
    data['HO'] = this.hO;
    data['OD'] = this.oD;
    data['Absent'] = this.absent;
    data['Leave'] = this.leave;
    data['Total'] = this.total;
    data['D_Present'] = this.dPresent;
    return data;
  }
}