import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/signup/signupModel.dart';
import '../../table/user/user_table.dart';

mixin IAuthRepository {
  Future<AuthResponse> onSingUpWithEmailPassword(SingUpData request);
  Future<AuthResponse> onSingUpWithApple();
  bool isLogin();
  Future<AuthResponse> onSingIn(SingUpData request);
  Future<void> onSignOut();
  void onSaveUserInfo(User user, {required String username});
}

class AuthRepository with IAuthRepository {
  final supabase = Supabase.instance;

  @override
  Future<AuthResponse> onSingUpWithEmailPassword(SingUpData request) {
    return supabase.client.auth
        .signUp(email: request.email, password: request.email);
  }

  @override
  Future<AuthResponse> onSingUpWithApple() {
    throw UnimplementedError();
  }

  @override
  bool isLogin() => supabase.client.auth.currentSession != null;

  @override
  Future<AuthResponse> onSingIn(SingUpData request) {
    return supabase.client.auth
        .signInWithPassword(email: request.email, password: request.email);
  }

  @override
  Future<void> onSignOut() async {
    await supabase.client.auth.signOut();
  }

  @override
  void onSaveUserInfo(User user, {required String username}) async {
    final userTable = UserTable();
    await supabase.client.rest.from(userTable.tableName).insert({
      userTable.uidColumn: user.id,
      userTable.emailColumn: user.email,
      userTable.userNameColumn: username
    });
  }
}
