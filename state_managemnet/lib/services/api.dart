import '../models/models.dart';
import '../services/services.dart';

final Network network = Network();
final endPointURL = {"login": "/login", "profile": "/profile"};

Future<UserToken> login(String username, String password) async {
  final body = {"username": username, "password": password};
  final endPoint = endPointURL["login"];
  final response = await network.unAuthorizedRequest(
      endPoint: endPoint, method: RequestMethod.POST, body: body);
  final UserToken userToken = UserToken.fromJson(response);
  return userToken;
}

Future<UserProfile> getUserProfile() async {
  final endPoint = endPointURL["profile"];
  final response = await network.authorizedRequest(endPoint: endPoint);
  final UserProfile userProfile = UserProfile.fromJson(response);
  return userProfile;
}

Future<ListItem> getListItem() async {
  final endPoint = endPointURL["getListItem"];
  final response = await network.authorizedRequest(endPoint: endPoint);
  final ListItem listItem = ListItem.fromJson(response);
  return listItem;
}
