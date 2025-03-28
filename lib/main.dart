import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'core/db/local_storage.dart';
import 'core/log.dart';
import 'core/utils/sp_util.dart';
import 'vm/location_tracker.dart';

// import 'core/log.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    RendererBinding.instance.ensureSemantics();

    // Init share preference
    await SpUtil.getInstance();
    // Init local storage (Hive)
    final localStorage = WSLocalStorage();
    await localStorage.init();

    if (Platform.isAndroid) {
      // Register flutter_background_geolocation headless task
      final registerBgSuccessfully = await registerBgHeadlessTask();
      if (registerBgSuccessfully) {
        Log.d('App start',
            'register flutter_background_geolocation headless task successfully');
      } else {
        Log.e('App Error',
            'Failed to register flutter_background_geolocation headless task');
      }

      // Register flutter_background_geolocation headless task
      final registerBfSuccessfully = await registerBfHeadlessTask();
      if (registerBfSuccessfully) {
        Log.d('App start',
            'register background_fetch headless task successfully');
      } else {
        Log.e('App Error', 'Failed to register background_fetch headless task');
      }
    }

    runApp(const ProviderScope(child: App()));
  }, _handleError);
}

/// Prints the error and reports it to firebase crashlytics in release mode.
Future<void> _handleError(Object error, StackTrace stackTrace) async {
  if (error is SocketException) {
    // no internet connection, can be ignored
    Log.w('App on SocketException',
        'ignoring internet connection error $error, $stackTrace');
    return;
  }

  if (error is Error) {
    Log.e('App Error', error.toString(), error, stackTrace);
  }

  if (kReleaseMode) {
    /// report the error in release mode
  } else {
    Log.e('App Error', error.toString(), error, stackTrace);
  }
}
