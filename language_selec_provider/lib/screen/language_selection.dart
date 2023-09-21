import 'package:flutter/material.dart';

import 'package:codediva_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';
// นำเข้าไฟล์ localization_th.dart
import 'package:codediva_app/language/localization_th.dart';

// นำเข้าไฟล์ localization_en.dart
import 'package:codediva_app/language/localization_en.dart';

 // นำเข้าคลาส Flutter Localizations




class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกภาษา'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'เลือกภาษาของคุณ',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              languageProvider.currentLanguage['helloWorld']!,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                languageProvider.setLanguage(localizationTh);
              },
              child: Text('ไทย'),
            ),
            const SizedBox(height: 5,),
            ElevatedButton(
              onPressed: () {
                languageProvider.setLanguage(localizationEn);
              },
              child: Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}