import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'view_state.dart';

class ViewStateModel extends ChangeNotifier {
  /// 防止页面销毁后，异步任务才完成，导致报错
  bool _disposed = false;

  String? _errorMsg;
  String? get errorMsg => _errorMsg;

  /// 当前的页面状态,默认为busy,可在viewModel的构造方法中指定;
  late ViewState _viewState;
  ViewState get viewState => _viewState;

  ViewStateModel({ViewState? viewState})
      : _viewState = viewState ?? ViewState.idle {
    debugPrint('ViewStateModel---constructor--->$runtimeType');
  }

  set viewState(ViewState viewState) {
    _errorMsg = null;
    _viewState = viewState;
    notifyListeners();
  }

  /// set
  void setIdle() {
    viewState = ViewState.idle;
  }

  void setBusy() {
    viewState = ViewState.busy;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }

  void setError(String error) {
    _errorMsg = error;
    viewState = ViewState.error;
  }

  /// 显示错误消息
  showErrorMessage(context, {String? message}) {
    if (_errorMsg != null || message != null) {
      message ??= errorMsg;
      Future.microtask(() {
        showToast(message!, context: context);
      });
    }
  }

  @override
  String toString() {
    return 'BaseModel{_viewState: $viewState, _viewStateError: $errorMsg}';
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    debugPrint('view_state_model dispose -->$runtimeType');
    super.dispose();
  }
}

// [e]为错误类型 :可能为 Error , Exception ,String
/// [s]为堆栈信息
printErrorStack(e, s) {
  debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
$e
<-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
  if (s != null) debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
$s
<-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
    ''');
}