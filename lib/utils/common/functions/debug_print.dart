import 'package:flutter/foundation.dart';

void printIfDebug(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}
