import 'package:flutter/material.dart';

// นำเข้าไฟล์ localization_th.dart
import 'package:codediva_app/language/localization_th.dart';

// นำเข้าไฟล์ localization_en.dart
import 'package:codediva_app/language/localization_en.dart';

class LanguageProvider with ChangeNotifier {
  Map<String, String> _currentLanguage = localizationTh;

  Map<String, String> get currentLanguage => _currentLanguage;

  set currentLanguage(Map<String, String> newLanguage) {
    if (_currentLanguage != newLanguage) {
      _currentLanguage = newLanguage;
      notifyListeners(); // แจ้งเตือน widgets ที่ฟังการเปลี่ยนแปลงของ currentLanguage ว่าค่าได้เปลี่ยน
    }
  }

  setLanguage(Map<String, String> language) {
    currentLanguage = language; // เปลี่ยนภาษาและแจ้งเตือน widgets
  }
}