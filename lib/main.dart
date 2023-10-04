import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Memulai dengan halaman Sign In
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Hi! Welcome back, you have been missed',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 45),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5, right: 42.5),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your username!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5, right: 42.5),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your password!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 42.5),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    print('Forgot Password Function');
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomepageMahasiswa()));
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                      left: 80, right: 80, top: 10, bottom: 10),
                  backgroundColor: const Color.fromRGBO(39, 55, 77, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: const Text(
                'Login',
                style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: Row(
                children: [
                  const Text(
                    'Do not have an account?',
                    style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 135),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              'Fill your information below',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 45),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5, right: 42.5),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your name!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'NIM',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5, right: 42.5),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your NIM!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5, right: 42.5),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your phone number!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5, right: 42.5),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your new username!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5, right: 42.5),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your new password!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5, right: 42.5),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm your new password!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                print('Sign In Function');
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                      left: 80, right: 80, top: 10, bottom: 10),
                  backgroundColor: const Color.fromRGBO(39, 55, 77, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: const Text(
                'Register',
                style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 42.5),
              child: Row(
                children: [
                  const Text(
                    'Do you have an account?',
                    style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 135,
            ),
          ],
        ),
      ),
    ));
  }
}

// ignore: must_be_immutable
class HomepageMahasiswa extends StatefulWidget {
  @override
  _HomepageMahasiswaState createState() => _HomepageMahasiswaState();
}

class _HomepageMahasiswaState extends State<HomepageMahasiswa> {
  int _currentIndex = 0;
  final List<Map<String, String>>listDosen=[
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 1",
      "NIDM" : "NIDM Dosen 1",
    },
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 2",
      "NIDM" : "NIDM Dosen 2",
    },
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 3",
      "NIDM" : "NIDM Dosen 3",
    },
        {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 1",
      "NIDM" : "NIDM Dosen 1",
    },
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 2",
      "NIDM" : "NIDM Dosen 2",
    },
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 3",
      "NIDM" : "NIDM Dosen 3",
    },
        {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 1",
      "NIDM" : "NIDM Dosen 1",
    },
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 2",
      "NIDM" : "NIDM Dosen 2",
    },
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 3",
      "NIDM" : "NIDM Dosen 3",
    },
        {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 1",
      "NIDM" : "NIDM Dosen 1",
    },
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 2",
      "NIDM" : "NIDM Dosen 2",
    },
    {
      "Gambar" : "style/img/testDosen1.png",
      "Nama" : "Nama Dosen 3",
      "NIDM" : "NIDM Dosen 3",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color.fromRGBO(39, 55, 77, .40),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('INFORMATEACH', style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  ),),
                background: Image.asset(
                  "style/img/unesa 2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final data = listDosen[index];
                  if (index==0){
                    return Column(
                      children: [
                      Container(margin: EdgeInsets.only(top: 10),
                        child: Text("Daftar Dosen",style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),),),
                    Container(
                    width: 285,
                    height: 140,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(82, 109, 130, .85),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, .60),
                          offset: Offset(0, 1),
                          spreadRadius: 3,
                          blurRadius: 7,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          data["Gambar"]!,
                          width: 101,
                          height: 138,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 20),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 38),
                                child: Text(
                                  data["Nama"]!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Quicksand',
                                  ),
                                ),
                              ),
                              Text(
                                data["NIDM"]!,
                                style: TextStyle(
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
                  )
                    ],);
                  }
                  
                  return Container(
                    width: 260,
                    height: 138,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(82, 109, 130, .85),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, .60),
                          offset: Offset(0, 1),
                          spreadRadius: 3,
                          blurRadius: 7,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          data["Gambar"]!,
                          width: 101,
                          height: 138,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 20),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 38),
                                child: Text(
                                  data["Nama"]!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Quicksand',
                                  ),
                                ),
                              ),
                              Text(
                                data["NIDM"]!,
                                style: TextStyle(
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
                  );
                },
                childCount: listDosen.length,
              ),
            ),
          ],
        ),

    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Color.fromRGBO(39, 55, 77, 1),
      currentIndex: _currentIndex,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.calendar_month, color: Colors.white,), label: "Schedule"),
      BottomNavigationBarItem(icon: Icon(Icons.confirmation_number, color: Colors.white), label: "Tiket"),
      BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white), label: "Profile"),
    ],
    unselectedItemColor: Colors.white,
    onTap: (index) {
      setState(() {
        _currentIndex = index;
      });
    },
    ),

  ));
}
}

class profileMahasiswa extends StatelessWidget {
  const profileMahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}