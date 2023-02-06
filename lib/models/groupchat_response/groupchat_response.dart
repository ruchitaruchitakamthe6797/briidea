class GroupChatResponse {
  bool? status;
  String? message;
  Null? data;
  bool? groupRow;

  GroupChatResponse({this.status, this.message, this.data, this.groupRow});

  GroupChatResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    groupRow = json['group_row'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    data['group_row'] = this.groupRow;
    return data;
  }
}
