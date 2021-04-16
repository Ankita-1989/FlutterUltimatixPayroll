class ClockInOutModel {
  bool status;
  String msg;
  Data data;

  ClockInOutModel({this.status, this.msg, this.data});

  ClockInOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int iOTranDetailsID;
  String inOutFlag;
  String iODatetime;
  String location;
  String reason;

  Data(
      {this.iOTranDetailsID,
        this.inOutFlag,
        this.iODatetime,
        this.location,
        this.reason});

  Data.fromJson(Map<String, dynamic> json) {
    iOTranDetailsID = json['IO_Tran_DetailsID'];
    inOutFlag = json['In_Out_Flag'];
    iODatetime = json['IO_Datetime'];
    location = json['Location'];
    reason = json['Reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IO_Tran_DetailsID'] = this.iOTranDetailsID;
    data['In_Out_Flag'] = this.inOutFlag;
    data['IO_Datetime'] = this.iODatetime;
    data['Location'] = this.location;
    data['Reason'] = this.reason;
    return data;
  }
}