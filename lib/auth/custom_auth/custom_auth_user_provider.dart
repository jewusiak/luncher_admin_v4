import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class LuncherAdminV4AuthUser {
  LuncherAdminV4AuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<LuncherAdminV4AuthUser> luncherAdminV4AuthUserSubject =
    BehaviorSubject.seeded(LuncherAdminV4AuthUser(loggedIn: false));
Stream<LuncherAdminV4AuthUser> luncherAdminV4AuthUserStream() =>
    luncherAdminV4AuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
