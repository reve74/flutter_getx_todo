import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final _box = GetStorage(); // initialize 필요
  final _key = 'isDarkMode';

  // 라이트모드로 변경
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  // 다크모드로 변경
  bool _loadThemeFromBox()=> _box.read(_key) ?? false; // 기본값 = false

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

}