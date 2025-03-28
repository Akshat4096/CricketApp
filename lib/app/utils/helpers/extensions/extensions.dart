import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferencesX on SharedPreferences {
  String? get getToken {
    return getString('token');
  }

  set setToken(String? value) {
    if (value == null) {
      remove('token');
    } else {
      setString('token', value);
    }
  }

  String? get getAppLocal {
    return getString('appLocal');
  }

  set setAppLocal(String? value) {
    if (value == null) {
      remove('appLocal');
    } else {
      setString('appLocal', value);
    }
  }

  set setskipintro(String? value) {
    if (value == null) {
      remove('intro');
    } else {
      setString('intro', value);
    }
  }

  String? get getskipintro {
    return getString('intro');
  }

  Future<void> clearPreferences() async {
    await clear();
  }

  Future<void> cleartoken() async {
    await remove('token');
  }
}

extension StringX on String {
  String get convertMd5 => md5.convert(utf8.encode(this)).toString();
}

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
