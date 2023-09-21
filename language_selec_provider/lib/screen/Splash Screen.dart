import 'package:flutter/material.dart';
import 'package:codediva_app/screen/language_selection.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // เพิ่มโค้ดการทำงานหลังจากที่ Splash Screen แสดง เช่น การโหลดข้อมูลหรือการเช็คสถานะเข้าสู่ระบบ
    Future.delayed(Duration(seconds: 3), () {
      // คุณสามารถนำผู้ใช้ไปยังหน้าถัดไปหรือกระทำสิ่งที่ต้องการทำในที่นี้
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LanguageSelection()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
