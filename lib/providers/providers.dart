library providers;

// https://codewithandrea.com/articles/flutter-state-management-riverpod/

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopat/utils/helpers/enum.dart';
import 'package:stopat/utils/localization.dart';

part 'src/app_theme/provider.dart';
part 'src/game/provider.dart';
part 'src/game/stopwatch/provider.dart';
part 'src/game/settings/provider.dart';
part 'src/game/settings/model.dart';
part 'src/game/settings/difficulty.dart';
part 'src/shared_preferences/provider.dart';
part 'src/shared_preferences/tc_shared_preference.dart';
part 'src/typedefs.dart';
part 'src/observer.dart';
