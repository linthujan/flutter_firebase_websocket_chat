class UserModel {
  late String user_id;
  late String username;
  late String mobile;

  UserModel({
    required this.user_id,
    required this.username,
    required this.mobile,
  });

  UserModel.fromJSON(Map<String, dynamic> json) {
    user_id = json['user_id'];
    username = json['username'];
    mobile = json['mobile'];
  }
}
