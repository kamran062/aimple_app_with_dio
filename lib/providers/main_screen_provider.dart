import 'dart:io';
import 'package:flutter/material.dart';
import '../models/setting_model.dart';

class HomeProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeTab(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}


class ItemProvider extends ChangeNotifier {
  List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }
}


class ProfileProvider extends ChangeNotifier {
  String _name = 'Kamran';
  String _bio = 'Flutter enthusiast';
  String _profilePicture = '';

  String get name => _name;
  String get bio => _bio;
  String get profilePicture => _profilePicture;

  void updateProfile(String newName, String newBio, String newPicture) {
    _name = newName;
    _bio = newBio;
    _profilePicture = newPicture;
    notifyListeners();
  }

  Future<void> updateProfilePicture(File newImageFile) async {
    await Future.delayed(Duration(seconds: 2));
    _profilePicture = '';
    notifyListeners();
  }
}





class SettingsProvider with ChangeNotifier {
  SettingsModel _settings;
  ThemeData? _currentTheme;

  SettingsProvider({
    required bool initialDarkMode,
    required bool initialNotifications,
  }) : _settings = SettingsModel(
    isDarkModeEnabled: initialDarkMode,
    areNotificationsEnabled: initialNotifications,
  ) {
    _currentTheme = _settings.isDarkModeEnabled ? _darkTheme : _lightTheme;
  }

  SettingsModel get settings => _settings;
  ThemeData? get currentTheme => _currentTheme;

  void toggleDarkMode() {
    _settings.isDarkModeEnabled = !_settings.isDarkModeEnabled;
    _currentTheme = _settings.isDarkModeEnabled ? _darkTheme : _lightTheme;
    notifyListeners();
  }

  void toggleNotifications() {
    _settings.areNotificationsEnabled = !_settings.areNotificationsEnabled;
    notifyListeners();
  }

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}

