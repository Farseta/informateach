// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:informateach/createTicket.dart';
import 'package:informateach/dialog/confirmTicketDialog.dart';
import 'package:informateach/dosen/database/db.dart';
import 'package:informateach/main.dart';

Map<String, dynamic> ticket = {};

class ConfirmTicket extends StatefulWidget {
  const ConfirmTicket({super.key});

  @override
  State<ConfirmTicket> createState() => _ConfirmTicketState();
}

class _ConfirmTicketState extends State<ConfirmTicket> {
  Map<String, dynamic> selectedDosen = {'temp': 'temp'};
  Future<void> fetchSelectedDosen() async {
    Map<String, dynamic> selectedDosenTmp = await getSelectedDosen(idDosen);
    setState(() {
      selectedDosen = selectedDosenTmp;
    });
  }

  @override
  void initState() {
    super.initState();
    ticket = {
      "Dosen": dosen,
      "Date": finalSelectedDay,
      "Time": finalSelectedTime,
      "Purpose": finalPurpose,
      "Gambar": "style/img/testDosen1.png",
    };
    fetchSelectedDosen();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    List<String> dateDetails = ticket['Date'].toString().split(' ');
    String dayName = getDayName(ticket['Date']);
    if (selectedDosen['temp'] == 'temp') {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  width: 286,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF27374D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Your Appoinment",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  selectedDosen['Image'] ?? 'style/img/DefaultIcon.png',
                  width: 101,
                  height: 138,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Handle error loading image
                    return Image.asset(
                      'style/img/DefaultIcon.png',
                      width: 101,
                      height: 138,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                SizedBox(
                  width: 31,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "${selectedDosen['Name']}",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${selectedDosen["Email"]}",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 47,
            ),
            Divider(
              height: 0,
              thickness: .3,
              color: Colors.black,
            ),
            SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${dayName}, ${dateDetails[0]}',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "${ticket["Time"]} WIB",
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Name   : ${currentUser['Name'] ?? 'Test'}",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "NIM      : ${currentUser["NIM"] ?? 'Test'}",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 19,
            ),
            Text(
              "PURPOSE",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 14),
            Container(
              width: 400,
              height: 146,
              decoration: ShapeDecoration(
                color: Color(0x33526D82),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF27374D)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(ticket["Purpose"])),
            ),
            SizedBox(
              height: 94,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmTicketDialog();
                    });
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
                      "CONFIRM",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
