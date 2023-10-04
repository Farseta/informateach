import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAppMahasiswa()));
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

class MyAppMahasiswaContainer extends StatelessWidget {
  const MyAppMahasiswaContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyAppMahasiswa(),
    );
  }
}

class MyAppMahasiswa extends StatefulWidget {
  const MyAppMahasiswa({super.key});

  @override
  State<MyAppMahasiswa> createState() => _MyAppMahasiswaState();
}

class _MyAppMahasiswaState extends State<MyAppMahasiswa> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    HomepageMahasiswa(),
    ProfilePage(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: true,
              notchColor: Colors.black87,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.calendar_month,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.calendar_month,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Schedule',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.confirmation_number,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.confirmation_number,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Ticket',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Profile',
                )
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}

class HomepageMahasiswa extends StatefulWidget {
  @override
  _HomepageMahasiswaState createState() => _HomepageMahasiswaState();
}

class _HomepageMahasiswaState extends State<HomepageMahasiswa> {
  final List<Map<String, String>> listDosen = [
    for (int i = 1; i <= 10; i++)
      {
        "Gambar": "style/img/testDosen1.png",
        "Nama": "Nama Dosen $i",
        "NIDM": "NIDM Dosen $i",
      }
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
              title: Text(
                'INFORMATEACH',
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final data = listDosen[index];
                if (index == 0) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Daftar Dosen",
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print("${data["NIDM"]} telah terpilih"),
                        child: Container(
                          width: 285,
                          height: 140,
                          margin: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
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
                        ),
                      )
                    ],
                  );
                } else if (index == listDosen.length - 1) {
                  return GestureDetector(
                      onTap: () {
                        print('${data["NIDM"]} Telah terpilih');
                      },
                      child: Container(
                        width: 160,
                        height: 138,
                        margin: EdgeInsets.only(
                            top: 15, left: 50, bottom: 90, right: 50),
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
                      ));
                } else {
                  return GestureDetector(
                      onTap: () {
                        print('${data["NIDM"]} Telah terpilih');
                      },
                      child: Container(
                        width: 160,
                        height: 138,
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
                      ));
                }
              },
              childCount: listDosen.length,
            ),
          ),
        ],
      ),
    ));
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan nilai dari database atau sesuai kebutuhan
    _nameController = TextEditingController(text: 'NAMA USER DARI DATABASE');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 17.5, top: 100),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    controller: _nameController,
                    enabled: _isEditing,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    controller: _nameController,
                    enabled: _isEditing,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    controller: _nameController,
                    enabled: _isEditing,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    controller: _nameController,
                    enabled: _isEditing,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_isEditing) {
                        // Simpan ke database atau lakukan tindakan lain
                        print('Nilai disimpan: ${_nameController.text}');
                      }
                      _isEditing = !_isEditing;
                    });
                  },
                  child: Text(_isEditing ? 'Save' : 'Edit'),
                ),
              ],
            ),
          ),
        ));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}
