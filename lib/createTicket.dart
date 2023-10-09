import 'package:flutter/material.dart';
import 'package:informateach/main.dart';

class AboutDosen extends StatefulWidget {
  const AboutDosen({super.key});

  @override
  State<AboutDosen> createState() => _AboutDosenState();
}

class _AboutDosenState extends State<AboutDosen> {
  String idDosen = IdDosen;
  late Map selectedDosen;

  void initState() {
    super.initState();
    selectedDosen = {
      "Gambar": "style/img/testDosen1.png",
      "Nama": "Nama Dosen $idDosen",
      "Prodi": "Prodi Dosen $idDosen",
      "NIP": "NIP Dosen $idDosen",
      "NIDN": "NIDN Dosen $idDosen",
      "Email": "Email Dosen $idDosen",
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(
      children: [
        SizedBox(
          height: 32,
        ),
        Image.asset(
          selectedDosen["Gambar"]!,
          width: 113.82,
          height: 163,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 19,
        ),
        Container(
            width: 256,
            height: 44,
            margin: EdgeInsets.all(0),
            decoration: ShapeDecoration(
              color: Color(0xFF27374D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                selectedDosen["Nama"],
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            )),
        SizedBox(
          height: 17,
        ),
        Container(
          width: 400,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
                child: Text(
              "ABOUT",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )),
            Image.asset("style/img/Line 2.png"),
            GestureDetector(
              child: Text(
                "SCHEDULE",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.2),
                  fontSize: 20,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 55,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  "Program Studi",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ))),
        Container(
          width: 325,
          height: 37,
          padding: EdgeInsets.only(left: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(selectedDosen["Prodi"]!)),
        ),
        SizedBox(
          height: 18,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  "NIP",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ))),
        Container(
          width: 325,
          height: 37,
          padding: EdgeInsets.only(left: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(selectedDosen["NIP"]!)),
        ),
        SizedBox(
          height: 18,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  "NIDN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ))),
        Container(
          width: 325,
          height: 37,
          padding: EdgeInsets.only(left: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(selectedDosen["NIDN"]!)),
        ),
        SizedBox(
          height: 18,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  "E-mail UNESA",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ))),
        Container(
          width: 325,
          height: 37,
          padding: EdgeInsets.only(left: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(selectedDosen["Email"]!)),
        ),
      ],
    ))));
  }
}
