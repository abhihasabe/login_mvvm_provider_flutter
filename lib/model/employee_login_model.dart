class EmployeeLoginModel {
  String? serverTimeStamp;
  String? statusCode;
  String? statusMsg;
  UserDetails? userDetails;

  EmployeeLoginModel({ this.serverTimeStamp, this.statusCode, this.statusMsg, this.userDetails});

  EmployeeLoginModel.fromJson(Map<String, dynamic> json) {
    serverTimeStamp = json['serverTimeStamp'];
    statusCode = json['StatusCode'];
    statusMsg = json['StatusMsg'];
    userDetails = (json['UserDetails'] != null ? new UserDetails.fromJson(json['UserDetails']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serverTimeStamp'] = this.serverTimeStamp;
    data['StatusCode'] = this.statusCode;
    data['StatusMsg'] = this.statusMsg;
    if (this.userDetails != null) {
      data['UserDetails'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? userType;
  String? userId;
  String? name;
  String? number;
  String? designation;
  String? profilePicUrl;
  String? scores;
  String? emailId;
  List<OtherDetailsList>? otherDetailsList;
  List<RoleList>? roleList;

  UserDetails(
      {  this.userType,
         this.userId,
         this.name,
         this.number,
         this.designation,
         this.profilePicUrl,
         this.scores,
         this.emailId,
         this.otherDetailsList,
         this.roleList});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    userId = json['userId'];
    name = json['name'];
    number = json['number'];
    designation = json['designation'];
    profilePicUrl = json['profilePicUrl'];
    scores = json['scores'];
    emailId = json['emailId'];
    if (json['otherDetailsList'] != null) {
      otherDetailsList = [];
      json['otherDetailsList'].forEach((v) {
        otherDetailsList!.add(new OtherDetailsList.fromJson(v));
      });
    }
    if (json['roleList'] != null) {
      roleList = [];
      json['roleList'].forEach((v) {
        roleList!.add(new RoleList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['number'] = this.number;
    data['designation'] = this.designation;
    data['profilePicUrl'] = this.profilePicUrl;
    data['scores'] = this.scores;
    data['emailId'] = this.emailId;
    if (this.otherDetailsList != null) {
      data['otherDetailsList'] =
          this.otherDetailsList!.map((v) => v.toJson()).toList();
    }
    if (this.roleList != null) {
      data['roleList'] = this.roleList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherDetailsList {
  List<StateList>? stateList;
  String? zoneId;

  OtherDetailsList({this.stateList, this.zoneId});

  OtherDetailsList.fromJson(Map<String, dynamic> json) {
    if (json['stateList'] != null) {
      stateList = [];
      json['stateList'].forEach((v) {
        stateList!.add(new StateList.fromJson(v));
      });
    }
    zoneId = json['zoneId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stateList != null) {
      data['stateList'] = this.stateList!.map((v) => v.toJson()).toList();
    }
    data['zoneId'] = this.zoneId;
    return data;
  }
}

class StateList {
  List<AoList>? aoList;
  String? stateId;
  String? stateName;

  StateList({this.aoList,this.stateId,this.stateName});

  StateList.fromJson(Map<String, dynamic> json) {
    if (json['aoList'] != null) {
      aoList = [];
      json['aoList'].forEach((v) {
        aoList!.add(new AoList.fromJson(v));
      });
    }
    stateId = json['stateId'];
    stateName = json['stateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aoList != null) {
      data['aoList'] = this.aoList!.map((v) => v.toJson()).toList();
    }
    data['stateId'] = this.stateId;
    data['stateName'] = this.stateName;
    return data;
  }
}

class AoList {
  List<DealerList>? dealerList;
  String? aoCode;
  String? aoName;

  AoList({this.dealerList,this.aoCode,this.aoName});

  AoList.fromJson(Map<String, dynamic> json) {
    if (json['dealerList'] != null) {
      dealerList = [];
      json['dealerList'].forEach((v) {
        dealerList!.add(new DealerList.fromJson(v));
      });
    }
    aoCode = json['aoCode'];
    aoName = json['aoName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dealerList != null) {
      data['dealerList'] = this.dealerList!.map((v) => v.toJson()).toList();
    }
    data['aoCode'] = this.aoCode;
    data['aoName'] = this.aoName;
    return data;
  }
}

 class DealerList {
  String? dealerCode;
  String? dealerName;
  String? dealerBranchCode;

  DealerList({this.dealerCode,this.dealerName,this.dealerBranchCode});

  DealerList.fromJson(Map<String, dynamic> json) {
    dealerCode = json['dealerCode'];
    dealerName = json['dealerName'];
    dealerBranchCode = json['dealerBranchCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dealerCode'] = this.dealerCode;
    data['dealerName'] = this.dealerName;
    data['dealerBranchCode'] = this.dealerBranchCode;
    return data;
  }
}

class RoleList {
  String? roleId;
  String? roleName;
  String? roleDesc;

  RoleList({this.roleId,this.roleName,this.roleDesc});

  RoleList.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    roleDesc = json['roleDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['roleName'] = this.roleName;
    data['roleDesc'] = this.roleDesc;
    return data;
  }
}