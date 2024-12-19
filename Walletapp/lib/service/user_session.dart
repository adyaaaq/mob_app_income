class UserSession {
  static final UserSession _instance = UserSession._internal();

  factory UserSession() {
    return _instance;
  }

  UserSession._internal();

  Map<String, dynamic>? userData;
  List<dynamic>? transactions; // To store transactions

  void setUserData(Map<String, dynamic> data) {
    userData = data;
  }

  void setTransactions(List<dynamic> data) {
    transactions = data;
  }

  void clearUserData() {
    userData = null;
    transactions = null;
  }

  bool get isLoggedIn => userData != null;
}
