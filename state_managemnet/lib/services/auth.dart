import 'api.dart';
import 'sharedPrefs.dart';
import '../models/models.dart';

Future _fetchAllData() async {
  return await Future.wait([getUserProfile(), getListItem()]);
}

Future<bool> createSession() async {
  try {
    final map = await SharedPrefs.getMap('userToken');
    UserToken userToken = UserToken(token: map["token"], userId: map["userId"]);
    if (userToken != null) {
      final values = await _fetchAllData();
      print("Values: $values");
      return true;
    } else {
      print("Couldn't found userToken");
      return false;
    }
  } catch (error) {
    print("error $error");
    return false;
  }
}

Future<bool> loginAndCreateSession(String username, String password) async {
  try {
    final userToken = await login(username, password);
    await SharedPrefs.setMap("userToken", userToken.toMap());
    return true;
  } catch (error) {
    print("error $error");
    return false;
  }
}
