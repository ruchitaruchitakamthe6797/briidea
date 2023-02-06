class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://briidea.ensurechat.com/api/";
  // static const String baseUrl = "https://api-stage.foxpe.in/api";


  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;


  static const String register = baseUrl + "/account/register";


  // getUserList endpoints
  static const String getUserList = baseUrl + "UserChat/showUserListforChat/";

  // getGroupList endpoints
  static const String getGroupList =
      baseUrl + "ChatGroup/showGroupListforChat/";

        // getUserList endpoints
  static const String getUserChatList = baseUrl + "UserChat/row?id=63&start=0";

  // getGroupList endpoints
  static const String getGroupChatList =
      baseUrl + "ChatGroup_Messages/row?id=13&start=0";
}
