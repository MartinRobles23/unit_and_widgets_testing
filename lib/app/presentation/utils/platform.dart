import 'package:flutter/foundation.dart';

bool get isIOS {
  if (!kIsWeb) {
    return defaultTargetPlatform == TargetPlatform.iOS;
  } else {
    return false;
  }
}

bool get isAndroid {
  if (!kIsWeb) {
    return defaultTargetPlatform == TargetPlatform.android;
  } else {
    return false;
  }
}

bool get isMacOS {
  if (!kIsWeb) {
    return defaultTargetPlatform == TargetPlatform.macOS;
  } else {
    return false;
  }
}

bool get isLinux {
  if (!kIsWeb) {
    return defaultTargetPlatform == TargetPlatform.linux;
  } else {
    return false;
  }
}

bool get isWindows {
  if (!kIsWeb) {
    return defaultTargetPlatform == TargetPlatform.windows;
  } else {
    return false;
  }
}

bool get isWeb => kIsWeb;
