import 'api.dart';
import 'sharedPrefs.dart';
import '../models/models.dart';

Future _fetchAllData() async {
  return await 
}
Future<bool> createSession() async {
  UserToken userToken = await SharedPrefs.get('userToken');
  if (userToken != null) {
    await Future.delayed(Duration(seconds: 3));
    return true;
  } else {
    return false;
  }
}

Future<bool> loginAndCreateSession(String username, String password) async {
  try {
    final userToken = await login(username, password);
  } catch (error) {
    return false;
  }
}
