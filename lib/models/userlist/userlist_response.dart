class UserListResponse {
  bool? status;
  String? message;
  List<Data>? data;
  List<NewChat>? newChat;

  UserListResponse({this.status, this.message, this.data, this.newChat});

  UserListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['new_chat'] != null) {
      newChat = <NewChat>[];
      json['new_chat'].forEach((v) {
        newChat!.add(new NewChat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.newChat != null) {
      data['new_chat'] = this.newChat!.map((v) => v.toJson()).toList();
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

class NewChat {
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
  String? groupId;
  String? designationName;
  String? companyName;
  String? address;

  NewChat(
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
      this.isOnline,
      this.groupId,
      this.designationName,
      this.companyName,
      this.address});

  NewChat.fromJson(Map<String, dynamic> json) {
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
    groupId = json['group_id'];
    designationName = json['designation_name'];
    companyName = json['company_name'];
    address = json['address'];
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
    data['group_id'] = this.groupId;
    data['designation_name'] = this.designationName;
    data['company_name'] = this.companyName;
    data['address'] = this.address;
    return data;
  }
}
