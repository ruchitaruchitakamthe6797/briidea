class UserChatResponse {
  bool? status;
  String? message;
  List<Data>? data;
  SenderDataRow? senderDataRow;
  ReceiverDataRow? receiverDataRow;

  UserChatResponse(
      {this.status,
      this.message,
      this.data,
      this.senderDataRow,
      this.receiverDataRow});

  UserChatResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    senderDataRow = json['sender_data_row'] != null
        ? new SenderDataRow.fromJson(json['sender_data_row'])
        : null;
    receiverDataRow = json['receiver_data_row'] != null
        ? new ReceiverDataRow.fromJson(json['receiver_data_row'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    // data['data'] = this.data;
     if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.senderDataRow != null) {
      data['sender_data_row'] = this.senderDataRow!.toJson();
    }
    if (this.receiverDataRow != null) {
      data['receiver_data_row'] = this.receiverDataRow!.toJson();
    }
    return data;
  }
}

class Data {
  String? messageId;
  Null? senderInfo;
  Null? receiverInfo;
  String? message;
  String? messageTime;
  String? isSeen;
  String? isDeleted;
  String? isDelivered;
  String? isSent;
  String? senderMessageId;
  String? receiverMessageId;
  String? id;
  String? firstname;
  String? lastname;
  String? companyId;
  String? countUnseenmessageInfo;
  String? companyName;
  String? address;
  String? designationName;

  Data(
      {this.messageId,
      this.senderInfo,
      this.receiverInfo,
      this.message,
      this.messageTime,
      this.isSeen,
      this.isDeleted,
      this.isDelivered,
      this.isSent,
      this.senderMessageId,
      this.receiverMessageId,
      this.id,
      this.firstname,
      this.lastname,
      this.companyId,
      this.countUnseenmessageInfo,
      this.companyName,
      this.address,
      this.designationName});

  Data.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    senderInfo = json['sender_info'];
    receiverInfo = json['receiver_info'];
    message = json['message'];
    messageTime = json['message_time'];
    isSeen = json['is_seen'];
    isDeleted = json['is_deleted'];
    isDelivered = json['is_delivered'];
    isSent = json['is_sent'];
    senderMessageId = json['sender_message_id'];
    receiverMessageId = json['receiver_message_id'];
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    companyId = json['company_id'];
    countUnseenmessageInfo = json['count_unseenmessage_info'];
    companyName = json['company_name'];
    address = json['address'];
    designationName = json['designation_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['sender_info'] = this.senderInfo;
    data['receiver_info'] = this.receiverInfo;
    data['message'] = this.message;
    data['message_time'] = this.messageTime;
    data['is_seen'] = this.isSeen;
    data['is_deleted'] = this.isDeleted;
    data['is_delivered'] = this.isDelivered;
    data['is_sent'] = this.isSent;
    data['sender_message_id'] = this.senderMessageId;
    data['receiver_message_id'] = this.receiverMessageId;
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['company_id'] = this.companyId;
    data['count_unseenmessage_info'] = this.countUnseenmessageInfo;
    data['company_name'] = this.companyName;
    data['address'] = this.address;
    data['designation_name'] = this.designationName;
    return data;
  }
}

class SenderDataRow {
  String? lastOnlineAt;
  String? id;
  String? username;
  String? password;
  String? email;
  String? firstname;
  String? lastname;
  String? phone;
  String? gender;
  String? companyId;
  String? isActive;
  String? isDeleted;
  String? isVerified;
  Null? otp;
  String? isOnline;

  SenderDataRow(
      {this.lastOnlineAt,
      this.id,
      this.username,
      this.password,
      this.email,
      this.firstname,
      this.lastname,
      this.phone,
      this.gender,
      this.companyId,
      this.isActive,
      this.isDeleted,
      this.isVerified,
      this.otp,
      this.isOnline});

  SenderDataRow.fromJson(Map<String, dynamic> json) {
    lastOnlineAt = json['last_online_at'];
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    gender = json['gender'];
    companyId = json['company_id'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    isVerified = json['is_verified'];
    otp = json['otp'];
    isOnline = json['is_online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_online_at'] = this.lastOnlineAt;
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['company_id'] = this.companyId;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['is_verified'] = this.isVerified;
    data['otp'] = this.otp;
    data['is_online'] = this.isOnline;
    return data;
  }
}

class ReceiverDataRow {
  Null? lastOnlineAt;

  ReceiverDataRow({this.lastOnlineAt});

  ReceiverDataRow.fromJson(Map<String, dynamic> json) {
    lastOnlineAt = json['last_online_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_online_at'] = this.lastOnlineAt;
    return data;
  }
}
