import 'package:flutter/material.dart';

//verileri kalıcı olrk cihazda saklamak için sharedpreferencez ekledm
class Days extends StatefulWidget {
  const Days({super.key});

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  //kullanıcının yazdıgı metnikontorl etmke için controller
  TextEditingController controller = TextEditingController();
  int day = 0; //hangi gun secildiyse o  olck

  // SharedPreferences'tan kaydedilmiş notu alma fonksiyonu

  // Notu kaydetmek için fonksiyon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$day.gün'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 8,
            ),
            /*ElevatedButton(
             // onPressed: //notu kaydet,
              child: const Text('kaydet'),
            )*/
          ],
        ),
      ),
    );
  }
}
