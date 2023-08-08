import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stopat/generated/locales.g.dart';

typedef LK = LocaleKeys;
String ls(
  String key, {
  BuildContext? context,
  List<String>? args,
  Map<String, String>? namedArgs,
  String? gender,
}) {
  return tr(
    key,
    context: context,
    args: args,
    namedArgs: namedArgs,
    gender: gender,
  );
}
