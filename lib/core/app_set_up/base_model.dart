import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  dynamic _busyObject;

  bool get busy => _busy;
  dynamic get busyObject => _busyObject;

  bool loadWithBusyObject(dynamic newBusyObject) {
    return newBusyObject == _busyObject;
  }

  // Method to run a task with a busy loader
  Future<void> runBusyFuture(Future<void> Function() task,
      {dynamic busyObject}) async {
    try {
      setBusy(true, busyObject);
      await task();
    } finally {
      setBusy(false, null);
    }
  }

  // Method to set the busy state
  void setBusy(bool value, [dynamic busyObject]) {
    _busy = value;
    _busyObject = value ? busyObject : null;
    notifyListeners();
  }
}
