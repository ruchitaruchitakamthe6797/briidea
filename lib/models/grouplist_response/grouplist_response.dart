class GroupListResponse {
  bool? status;
  String? message;
  List<Data>? data;
  List<NewGroup>? newGroup;

  GroupListResponse({this.status, this.message, this.data, this.newGroup});

  GroupListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['new_group'] != null) {
      newGroup = <NewGroup>[];
      json['new_group'].forEach((v) {
        newGroup!.add(new NewGroup.fromJson(v));
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
    if (this.newGroup != null) {
      data['new_group'] = this.newGroup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? isActive;
  String? isDeleted;
  String? groupId;
  String? chatGroupName;
  String? groupMessagesId;
  int? unseenMsgs;

  Data(
      {this.isActive,
      this.isDeleted,
      this.groupId,
      this.chatGroupName,
      this.groupMessagesId,
      this.unseenMsgs});

  Data.fromJson(Map<String, dynamic> json) {
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    groupId = json['group_id'];
    chatGroupName = json['chat_group_name'];
    groupMessagesId = json['group_messages_id'];
    unseenMsgs = json['unseen_msgs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['group_id'] = this.groupId;
    data['chat_group_name'] = this.chatGroupName;
    data['group_messages_id'] = this.groupMessagesId;
    data['unseen_msgs'] = this.unseenMsgs;
    return data;
  }
}

class NewGroup {
  String? groupId;
  String? companyId;
  String? createdBy;
  String? chatGroupName;
  String? groupDescription;
  String? isActive;
  String? isDeleted;
  String? createdOn;
  String? updatedOn;
  String? userId;

  NewGroup(
      {this.groupId,
      this.companyId,
      this.createdBy,
      this.chatGroupName,
      this.groupDescription,
      this.isActive,
      this.isDeleted,
      this.createdOn,
      this.updatedOn,
      this.userId});

  NewGroup.fromJson(Map<String, dynamic> json) {
    groupId = json['group_id'];
    companyId = json['company_id'];
    createdBy = json['created_by'];
    chatGroupName = json['chat_group_name'];
    groupDescription = json['group_description'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group_id'] = this.groupId;
    data['company_id'] = this.companyId;
    data['created_by'] = this.createdBy;
    data['chat_group_name'] = this.chatGroupName;
    data['group_description'] = this.groupDescription;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['user_id'] = this.userId;
    return data;
  }
}
