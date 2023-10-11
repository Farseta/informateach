// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:informateach/confirmTicket.dart';
import 'package:informateach/main.dart';

String? finalSelectedDay;
String? finalSelectedTime;
String? finalPurpose;
String dosen = idDosen;

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
  String selectedDay = "Mon";
  String? selectedTime;
  TextEditingController _purposeController = TextEditingController();

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
        "09.00        Booked",
        "10.00        Available",
        "11.00        Available",
        "12.00        Booked",
      ],
      "Tue": [
        "10.00        Available",
        "11.00        Available",
        "12.00        Booked",
        "13.00        Booked",
        "14.00        Available",
        "15.00        Available",
      ],
      "Wed": [
        "13.00        Booked",
        "14.00        Booked",
        "15.00        Booked",
        "07.00        Booked",
        "08.00        Available",
        "09.00        Available",
      ],
      "Thu": [
        "07.00        Available",
        "08.00        Available",
        "09.00        Booked",
        "10.00        Booked",
        "11.00        Available",
        "12.00        Booked",
      ],
      "Fri": [
        "10.00        Booked",
        "11.00        Available",
        "12.00        Booked",
        "13.00        Available",
        "14.00        Available",
        "15.00        Booked",
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
            const SizedBox(
              height: 49,
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutDosen()));
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
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 177,
                  child: SingleChildScrollView(
                    child: Column(
                        children: dosenSchedule.keys.map((day) {
                      bool isSelected = selectedDay == day;
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDay = day;
                            });
                          },
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: ShapeDecoration(
                                color: isSelected
                                    ? const Color(0xFF3687E5)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color(0xFFD9D9D9), width: 1),
                                    borderRadius: BorderRadius.circular(7))),
                            child: Center(
                                child: Text(
                              day,
                              style: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontFamily: 'Quicksand',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      );
                    }).toList()),
                  ),
                ),
                Image.asset("style/img/Line 4.png"),
                SizedBox(
                  height: 177,
                  width: 190,
                  child: SingleChildScrollView(
                    child: Column(
                      children: dosenSchedule[selectedDay]!.map((time) {
                        List<String> timeInfo = time.split("        ");
                        String jam = timeInfo[0];
                        String status = timeInfo[1];

                        bool isAvailable = status == "Available";
                        bool isSelected = selectedTime == jam;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isAvailable) {
                                  print("Jam $jam sudah terbooking");
                                  selectedTime = isSelected ? null : jam;
                                }
                              });
                            },
                            child: Container(
                              width: 188,
                              height: 40,
                              decoration: ShapeDecoration(
                                color: isSelected
                                    ? const Color(0xFF3687E5)
                                    : (isAvailable
                                        ? Colors.white
                                        : const Color(0xFF27374D)),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFD9D9D9)),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              child: Center(
                                child: Text(time,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : (isAvailable
                                              ? Colors.black
                                              : Colors.white),
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )),
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
            SizedBox(
              height: 28,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 37),
                  child: Text(
                    "PURPOSE",
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Container(
              width: 320,
              height: 91,
              decoration: ShapeDecoration(
                color: Color(0x33526D82),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF27374D)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _purposeController,
                  decoration: InputDecoration(
                    border: InputBorder
                        .none, // Hapus border internal dari TextField
                    hintText: 'Enter your purpose',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            GestureDetector(
              onTap: () {
                finalSelectedDay = selectedDay;
                finalSelectedTime = selectedTime;
                dosen = idDosenNow;
                finalPurpose = _purposeController.text;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfirmTicket()));
              },
              child: Container(
                  width: 400,
                  height: 86,
                  decoration: ShapeDecoration(
                    color: Color(0xFF27374D),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "SELECT",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            )
          ]),
        ));
  }
}
