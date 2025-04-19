//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Months extends StatelessWidget {
  const Months({super.key, required this.monthName});
  final String monthName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFDF7F4),
        title: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.12,
            0,
            MediaQuery.of(context).size.width * 0.05,
            0,
          ),
          child: Text(
            monthName, // Dynamic month name
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
        //RESMİN ARKADA OLMASINI İSTEDGM İÇİN ONCE RESMİ KOYDUM
        children: [
          Positioned(
            left: -60,
            bottom: -70,
            child: Opacity(
              opacity: 0.4,
              child: SvgPicture.asset(
                'lib/assets/images/flor.svg',
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.only(left: 20, top: 20),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Column(
              children: [
                Text(
                  "P L A N N E R",
                  style: TextStyle(
                    color: Color(0xFF685752),
                    fontFamily: 'italian',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ), //gunlerle planner arası bosluk
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                    ...["Pzt", "Salı", "Çar", "Per", "Cum", "Cmt", "Paz"]
                        //map zaten bi liste dondurur ve sonra un direkt childrene eklemeey calısır ama öyle olmaz o yuzden map sonucunu ... ile açtık
                        .map(
                          (day) => Text(
                            day,
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF685752),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ), // Günler ile grid arasında boşluk

                Expanded(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: ["M", "O", "N", "T", "H", "L", "Y"]
                                .map(
                                  (char) => Text(
                                    char,
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Color(0xFF685752),
                                      fontFamily: 'italian',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),

                          //Column(), //EN BASTA ŞİMDİ PLANNERİ YAZDK SONRA KALAN KISMI Bİ SATIRA BOLDK BU SATIRI D 2 SUTUN BOLERDK AMA ONUN YERİNE 1 SUTUN Bİ GRİDE BOLCEZ
                          SizedBox(
                            //GRİDM sonsuza kdr uretilmesn diye sizedbox yaptk
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height *
                                0.5, //450 YDİ ONA GORE DUZENLEEE
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7,
                                crossAxisSpacing:
                                    MediaQuery.of(context).size.width * 0.01,
                                mainAxisSpacing:
                                    MediaQuery.of(context).size.height * 0.025,
                                childAspectRatio: 1,
                              ),
                              itemCount: 30,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  /*onTap: () { 
                                    Navigator.pushNamed( 
                                      context,
                                      '/day',
                                      arguments: index + 1,
                                    );
                                  },*/
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0XFf8EB486),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    //child: Center(child: Text('${index + 1}')),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ],
                  ),
                ),

                //SizedBox(height: 15),
              ],
            ),
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff8EB486),
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  //satır ve baslık için
                  children: [
                    Text(
                      "En Önemliler",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff685752),
                        fontFamily: 'italian',
                      ),
                    ),
                    Divider(
                      //BASLIK ALTINA CİZGİ
                      color: Color(0XFF997C70), // Çizgi rengi
                      thickness: 2, // Çizgi kalınlığı
                    ),
                    Row(
                      children: [
                        Icon(Icons.check, color: Colors.white), // İkon
                        SizedBox(width: 8), // İkon ile metin arasında boşluk
                        Text(
                          "Satır 1", // İçerik
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
