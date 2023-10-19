import 'package:flutter/material.dart';
import 'package:informateach/dosen/dialog/validate.dart';

class ScheduleDosen extends StatefulWidget {
  const ScheduleDosen({super.key});

  @override
  State<ScheduleDosen> createState() => _ScheduleDosenState();
}

class _ScheduleDosenState extends State<ScheduleDosen> {
  // List Ticket yang akan ditampilkan
  final List<Map<String, dynamic>> ticketData = [
    {
      "Date": "Mon, 9 Oct 2023",
      "Tickets": ["Ticket 1", "Ticket 2"]
    },
    {
      "Date": "Tue, 10 Oct 2023",
      "Tickets": ["Ticket 3", "Ticket 4"]
    },
    {
      "Date": "Wed, 11 Oct 2023",
      "Tickets": ["Ticket 5", "Ticket 6"]
    },
    {
      "Date": "Thu, 12 Oct 2023",
      "Tickets": ["Ticket 7", "Ticket 7"]
    },
    {
      "Date": "Fri, 13 Oct 2023",
      "Tickets": ["Ticket 9", "Ticket 10"]
    },
    {
      "Date": "Sat, 14 Oct 2023",
      "Tickets": ["Ticket 11", "Ticket 12"]
    },
    {
      "Date": "Sun, 15 Oct 2023",
      "Tickets": ["Ticket 13", "Ticket 14"]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: const Color.fromRGBO(29, 55, 77, .4),
          expandedHeight: 200,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              "INFORMATEACH",
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Image.asset(
              "style/img/unesa 2.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final data = ticketData[index];
                return _buildTimeSlot(data["Date"], data["Tickets"]);
              },
              childCount: ticketData.length,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildTimeSlot(String time, List<String> tickets) {
    return Column(
      children: [
        SizedBox(
          height: 19,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                time,
                style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
        SizedBox(
          height: 19,
        ),
        Column(
          children:
              tickets.map((ticket) => _buildTicket(ticket, time)).toList(),
        ),
      ],
    );
  }

  Widget _buildTicket(String ticket, String time) {
    return Container(
      width: 323,
      height: 80,
      margin: EdgeInsets.only(bottom: 15),
      decoration: ShapeDecoration(
        color: Color.fromARGB(255, 235, 240, 245),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0)
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 17,
          ),
          Text(
            "00.00",
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 14),
          VerticalDivider(
            color: Colors.black,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                "Nama $ticket",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "NIM $ticket",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 12,
                ),
              ),
              Text(
                "Tujuan $ticket",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 65,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ValidateTicketDialog();
                          });
                    },
                    child: Container(
                      width: 78,
                      height: 16,
                      decoration: ShapeDecoration(
                          color: Color(0xFF27374D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text(
                        "Validation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3687E5),
                            fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 60,
                    height: 16,
                    decoration: ShapeDecoration(
                        color: Color(0xFF27374D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Text(
                      "Decline",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF0000),
                          fontSize: 12),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _showTicketDetails(String ticket, String time) {
    // Tampilkan detail ticket sesuai kebutuhan, misalnya menggunakan AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Ticket'),
          content: Text('Waktu: $time\nTicket: $ticket'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
