import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:informateach/main.dart';

enum Days {
  mon,
  tue,
  wed,
  thu,
  fri,
}

class CreateTicket extends StatefulWidget {
  const CreateTicket({super.key});

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  String idDosenNow = idDosen;
  late Map selectedDosen;
  late Map<String, List<String>> dosenSchedule;
  String selectedDate = "Mon";

  @override
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
    dosenSchedule = {
      "Mon": [
        "07.00        Available",
        "08.00        Booked",
        "09.00        Available",
      ],
      "Tue": [
        "10.00        Available",
        "11.00        Available",
        "12.00        Booked",
      ],
      "Wed": [
        "13.00        Available",
        "14.00        Available",
        "15.00        Available",
      ],
      "Thu": [
        "07.00        Available",
        "08.00        Available",
        "09.00        Available",
      ],
      "Fri": [
        "10.00        Available",
        "11.00        Available",
        "12.00        Available",
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAppMahasiswa(initialPage: 0)));
          },
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(
          child: Container(
            width: 337,
            height: 163,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(39, 55, 77, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  selectedDosen["Gambar"]!,
                  width: 114,
                  height: 175,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedDosen["Nama"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      Text(
                        selectedDosen["NIDN"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 59,
        ),
        Container(
          width: 400,
          height: 55,
          decoration: const BoxDecoration(
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
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AboutDosen()));
                },
                child: Text(
                  "ABOUT",
                  style: TextStyle(
                    color: Colors.black.withOpacity(.2),
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )),
            Image.asset("style/img/Line 2.png"),
            GestureDetector(
              child: const Text(
                "SCHEDULE",
                style: TextStyle(
                  color: Colors.black,
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
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 177,
              child: SingleChildScrollView(
                child: Column(
                    children: dosenSchedule.keys.map((day) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDate = day;
                        });
                      },
                      child: Text(day),
                    ),
                  );
                }).toList()),
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(1.57),
              child: Container(
                width: 197,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 177,
              width: 190,
              child: SingleChildScrollView(
                child: Column(
                  children: dosenSchedule[selectedDate]!.map((time) {
                    List<String> timeInfo = time.split("        ");
                    String jam = timeInfo[0];
                    String status = timeInfo[1];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 188,
                          height: 40,
                          decoration: status == "Available"
                              ? ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                )
                              : ShapeDecoration(
                                  color: Color(0xFF27374D),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                          child: Center(
                            child: Text(
                              time,
                              style: status == "Available"
                                  ? TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )
                                  : TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
