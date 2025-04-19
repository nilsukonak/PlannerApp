//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:asilplanner/month.dart';

void main() {
  runApp(const Years());
}

class Years extends StatelessWidget {
  const Years({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFDF7F4),
        appBar: AppBar(
          backgroundColor: Color(0xFFFDF7F4),
          title: Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.23,
              MediaQuery.of(context).size.width * 0.05,
              0,
              0,
            ),
            child: Text(
              "P L A N N E R",
              style: TextStyle(
                color: Color(0xFF685752),
                fontFamily: 'italian',
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              left: -130,
              bottom: -150,
              child: Opacity(
                opacity:
                    0.4, // Opaklığı %50 yap (0.0 tamamen şeffaf, 1.0 tamamen görünür)
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      1, // **Genişlik ayarla**
                  height: MediaQuery.of(context).size.height *
                      0.7, // **Yükseklik ayarla**

                  child: SvgPicture.asset(
                    'lib/assets/images/flor.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 400,
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Sadece içerik kadar yer kaplamasını sağla
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: ["Y", "E", "A", "R", "L", "Y"]
                          .map(
                            (char) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height *
                                    0.005, //harfler arası bosluklar
                              ),
                              child: Text(
                                char,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Color(0xFF685752),
                                  fontFamily: 'italian',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  SizedBox(
                    width: 17, //yearly ve gridler arası genslk
                  ), // "YEARLY" ile Grid arasına boşluk ekledim

                  Expanded(
                    //epanded vardı ama cardların boyutunu yuksekliğini arttıramadmı o yuzden container yapıp ekranın yuzde 60 ını kaplasın dedm vazgectm

                    /// **SVG ARKA PLANDA**

                    //NEDEN EN SOLA DAYALI OLMUYO içindeki svg kdr kaplaralign o yuzden kucuk klaıoy olblr
                    child: GridView.builder(
                      //stack içindeki gridview builder en once olur
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 3 sütun olacak
                        childAspectRatio: 1.7, // Daha dikdörtgen görünüm için
                        crossAxisSpacing: 10,
                        mainAxisExtent: 90,
                        mainAxisSpacing: 27,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        List<String> months = [
                          "Ocak",
                          "Subat",
                          "Mart",
                          "Nisan",
                          "Mayıs",
                          "Haziran",
                          "Temmuz",
                          "Agustos",
                          "Eylül",
                          "Ekim",
                          "Kasım",
                          "Aralık",
                        ];
                        return GestureDetector(
                          onTap: () {
                            print(
                              "Tıklandı: ${months[index]}",
                            ); // Terminalde bu yazıyı görüyor musun?
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    Months(monthName: months[index]),
                              ),
                            );
                          },
                          child: Card(
                            color: Color(0xFF8EB486),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                months[index],
                                style: TextStyle(
                                  fontFamily: 'italian',
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF685752),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
