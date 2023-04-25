import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_demo/locator.dart';

import '../constants.dart';

class AuthProvider extends ChangeNotifier {
  User? _account;
  User? get account => _account;

  AuthProvider() {
    _getAccount();
  }

  _getAccount() async {
    final sessionId = GetX.spUtil.getString(Constants.keyOfSessionId);
    if (sessionId != null) {
      _account = await GetX.api.getAccount();
      notifyListeners();
    }
  }

  login({required String email, required String password}) async {
    final session = await GetX.api.login(email: email, password: password);
    final user = await GetX.api.getAccount();
    GetX.spUtil.putString(Constants.keyOfSessionId, session.$id);
    _account = user;
    notifyListeners();
  }

  logout() async {
    final sessionId = GetX.spUtil.getString(Constants.keyOfSessionId);
    if (sessionId?.isNotEmpty == true) {
      await GetX.api.logout(sessionId: sessionId!);
    }
    _account = null;
    GetX.spUtil.remove(Constants.keyOfSessionId);
    notifyListeners();
  }
}
