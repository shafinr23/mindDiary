class APIPath {
  static String mind(String uid, String mindId) => 'users/$uid/Minds/$mindId';
  static String minds(String uid) => 'users/$uid/Minds';
}
