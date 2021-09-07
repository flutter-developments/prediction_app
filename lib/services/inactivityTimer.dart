import 'dart:async';

import 'package:flutter/foundation.dart';

class InactivityTimer {
  InactivityTimer._privateConstructor();
  static final InactivityTimer instance = InactivityTimer._privateConstructor();

  Timer? _timer;
  late Function _onTimeout;
  late Duration _timeout;

  initialize({required Function onTimeout, required Duration timeout}) {
    this._onTimeout = onTimeout;
    this._timeout = timeout;
    resetTimer();
  }

  resetTimer() {
    _timer?.cancel();
    _timer = Timer(_timeout, this._onTimeout as void Function());
  }

  void logOutUser() {
    _timer?.cancel();
    _timer = null;
  }
}
