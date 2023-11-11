// ignore_for_file: use_key_in_widget_constructors, avoid_print, library_private_types_in_public_api, prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:informateach/auth/auth.dart';
import 'package:informateach/createTicket.dart';
import 'package:informateach/dialog/cancelTicketDialog.dart';
import 'package:informateach/dosen/database/db.dart';
import 'package:informateach/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Map userNow = {
  "Gambar": "style/img/testUser/png",
  "Nama": "Christiano Zetro AB Sinaga",
  "NIM": "21051204033",
  "Phone": "123456789123",
  "Gender": "Pria",
  // ignore: equal_keys_in_map
  "Gambar": _image,
};

late Map<String, dynamic> currentUser;
Uint8List? _image;
// late bool showBottomNavBar;
late bool showBottomNavBar;
late String idDosen;
User? user = FirebaseAuth.instance.currentUser;

Future getCurrentUser() async {
  try {
    var userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: user?.email)
        .get();

    if (userQuery.docs.isNotEmpty) {
      var userData = userQuery.docs.first.data();
      currentUser = userData;
    } else {
      print("data kosong");
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> editCurrentUserProfile(
    String name, String phone, String gender, String nim, String img) async {
  try {
    var userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: user?.email)
        .get();
    if (userQuery.docs.isNotEmpty) {
      var userDocument =
          userQuery.docs.first.reference; // Mendapatkan referensi dokumen
      await userDocument.update({
        'Name': name,
        'Phone Number': phone,
        'Gender': gender,
        'NIM': nim,
        'Image': img,
      });
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth(),
    );
  }
}

// ignore: must_be_immutable

class MyAppMahasiswaContainer extends StatelessWidget {
  const MyAppMahasiswaContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAppMahasiswa(
        initialPage: 0,
      ),
    );
  }
}

class MyAppMahasiswa extends StatefulWidget {
  final int initialPage;
  const MyAppMahasiswa({Key? key, required this.initialPage}) : super(key: key);

  @override
  State<MyAppMahasiswa> createState() => _MyAppMahasiswaState();
}

class _MyAppMahasiswaState extends State<MyAppMahasiswa> {
  var indexPage = 0;
  late final PageController _pageController;
  late final NotchBottomBarController _controller;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _controller = NotchBottomBarController(index: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            _controller.jumpTo(index);
            setState(() {
              indexPage = index;
            });
          },
          children: [
            HomepageMahasiswa(),
            const TicketMahasiswaPage(),
            ProfilePage(),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: AnimatedNotchBottomBar(
          notchBottomBarController: _controller,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 250),
                curve: Curves.bounceInOut);
            setState(() {
              indexPage = index;
            });
          },
          color: Colors.white,
          showLabel: false,
          notchColor: Colors.black87,
          bottomBarItems: const [
            BottomBarItem(
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
            BottomBarItem(
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
            BottomBarItem(
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
        ));
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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color.fromRGBO(39, 55, 77, .40),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(top: 19, left: 20),
                          child: const Text(
                            "Daftar Dosen",
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          idDosen = data["NIDM"]!;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutDosen()),
                          );
                        },
                        child: Container(
                          width: 285,
                          height: 140,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(39, 55, 77, 1),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
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
                              const SizedBox(width: 20),
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 38),
                                      child: Text(
                                        data["Nama"]!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Quicksand',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data["NIDM"]!,
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
                      )
                    ],
                  );
                } else if (index == listDosen.length - 1) {
                  return GestureDetector(
                      onTap: () {
                        idDosen = data["NIDM"]!;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutDosen()));
                      },
                      child: Container(
                        width: 160,
                        height: 138,
                        margin: const EdgeInsets.only(
                            top: 15, left: 50, bottom: 90, right: 50),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(39, 55, 77, 1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
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
                            const SizedBox(width: 20),
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 38),
                                    child: Text(
                                      data["Nama"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Quicksand',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data["NIDM"]!,
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
                      ));
                } else {
                  return GestureDetector(
                      onTap: () {
                        idDosen = data["NIDM"]!;
                        setState(() {
                          showBottomNavBar = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutDosen()));
                      },
                      child: Container(
                        width: 160,
                        height: 138,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(39, 55, 77, 1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
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
                            const SizedBox(width: 20),
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 38),
                                    child: Text(
                                      data["Nama"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Quicksand',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data["NIDM"]!,
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
                      ));
                }
              },
              childCount: listDosen.length,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutDosen extends StatefulWidget {
  const AboutDosen({Key? key}) : super(key: key);

  @override
  State<AboutDosen> createState() => _AboutDosenState();
}

class _AboutDosenState extends State<AboutDosen> {
  String idDosenNow = idDosen;
  late Map selectedDosen;

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
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          children: [
            Image.asset(
              selectedDosen["Gambar"]!,
              width: 113.82,
              height: 163,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 19,
            ),
            Container(
                width: 256,
                height: 44,
                margin: const EdgeInsets.all(0),
                decoration: ShapeDecoration(
                  color: const Color(0xFF27374D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    const BoxShadow(
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
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                )),
            const SizedBox(
              height: 17,
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
                        child: const Text(
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
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateTicket()));
                      },
                    )
                  ]),
            ),
            const SizedBox(
              height: 55,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.only(
                      left: 35,
                    ),
                    child: const Text(
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
              padding: const EdgeInsets.only(left: 10),
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
            const SizedBox(
              height: 18,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.only(
                      left: 35,
                    ),
                    child: const Text(
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
              padding: const EdgeInsets.only(left: 10),
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
            const SizedBox(
              height: 18,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.only(
                      left: 35,
                    ),
                    child: const Text(
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
              padding: const EdgeInsets.only(left: 10),
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
            const SizedBox(
              height: 18,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.only(
                      left: 35,
                    ),
                    child: const Text(
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
              padding: const EdgeInsets.only(left: 10),
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

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController,
      _phoneController,
      _genderController;
  final bool _isEditing = true;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  Future<String> uploadProfilePict(Uint8List image) async {
    Reference ref =
        FirebaseStorage.instance.ref().child('userProfilePict/${user?.email}');
    UploadTask upload = ref.putData(image);
    TaskSnapshot snapshot = await upload;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  void saveChanges() async {
    String img = await uploadProfilePict(_image!);
    bool done = await editCurrentUserProfile(_nameController.text,
        _phoneController.text, _genderController.text, "21051204033", img);
    if (done) {
      Navigator.pop(context);
    }
  }

  void cancelEdit() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: currentUser["Name"]!);
    _phoneController =
        TextEditingController(text: currentUser["Phone Number"]!);
    _genderController = TextEditingController(text: "Pria");
  }

  Future<bool> _onBackPressed() async {
    print('Tombol Back ditekan');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 14, top: 11),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('style/img/LogoInformateach.png'),
                )),
            Stack(
              children: [
                _image != null
                    ? Container(
                        margin: const EdgeInsets.only(top: 44),
                        child: ClipOval(
                          child: Image.memory(
                            _image!,
                            height: 180,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ))
                    : Container(
                        margin: const EdgeInsets.only(top: 44),
                        child: ClipOval(
                            child: Image.asset(
                          'style/img/DefaultIcon.png',
                          height: 180,
                          width: 180,
                          fit: BoxFit.cover,
                        )),
                      ),
                Positioned(
                  child: IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: selectImage,
                  ),
                  bottom: -10,
                  right: 4,
                )
              ],
            ),

            //Name User Container
            Container(
                margin: const EdgeInsets.only(left: 28, top: 45),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: TextField(
                controller: _nameController,
                enabled: _isEditing,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //Phone Number Container
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(left: 28),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: TextField(
                controller: _phoneController,
                enabled: _isEditing,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //Gender User Container
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(left: 28),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gender",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: DropdownButtonFormField(
                value: _genderController.text,
                items: ['Pria', 'Wanita'].map((String gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _genderController.text = value;
                    });
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 68,
            ),

            //Save and Cancel Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(115, 45),
                      backgroundColor: const Color.fromRGBO(82, 109, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      )),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => cancelEdit(),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(115, 45),
                    backgroundColor: const Color.fromRGBO(39, 55, 77, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController,
      _phoneController,
      _genderController;
  final bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan nilai dari database atau sesuai kebutuhan
    _nameController = TextEditingController(text: currentUser['Name']);
    _phoneController = TextEditingController(text: currentUser['Phone Number']);
    _genderController = TextEditingController(
        text: currentUser['Gender'] == '' ? 'Kosong' : currentUser['Gender']);
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 14, top: 11),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('style/img/LogoInformateach.png'),
              )),
          Stack(
            children: [
              currentUser['Image'] != ''
                  ? Container(
                      margin: const EdgeInsets.only(top: 44),
                      child: ClipOval(
                        child: Image.network(
                          currentUser['Image']!,
                          height: 180,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                      ))
                  : Container(
                      margin: const EdgeInsets.only(top: 44),
                      child: ClipOval(
                        child: Image.asset(
                          'style/img/DefaultIcon.png',
                          height: 180,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ],
          ),

          //Name User Container
          Container(
              margin: const EdgeInsets.only(left: 28, top: 45),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                  ),
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: _nameController,
              enabled: _isEditing,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),

          //Phone Number Container
          const SizedBox(
            height: 15,
          ),
          Container(
              margin: const EdgeInsets.only(left: 28),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                  ),
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: _phoneController,
              enabled: _isEditing,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),

          //Gender User Container
          const SizedBox(
            height: 15,
          ),
          Container(
              margin: const EdgeInsets.only(left: 28),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                  ),
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: _genderController,
              enabled: _isEditing,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 68,
          ),

          //Log Out Button and Edit Profile Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(115, 45),
                    backgroundColor: const Color.fromRGBO(82, 109, 130, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    )),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(115, 45),
                  backgroundColor: const Color.fromRGBO(39, 55, 77, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}

class TicketMahasiswaPage extends StatefulWidget {
  const TicketMahasiswaPage({super.key});

  @override
  State<TicketMahasiswaPage> createState() => _TicketMahasiswaPageState();
}

class _TicketMahasiswaPageState extends State<TicketMahasiswaPage> {
  final List<Map<String, dynamic>> listTicket = [
    for (int i = 5; i <= 6; i++)
      {
        "Id": "ID Tiket $i",
        "Dosen": "Dosen Tiket $i",
        "Tanggal": "3 October 2023",
        "Jam": "10.00",
        "Tujuan": "Tujuan Pertemuan Tiket $i",
        "Gambar": "style/img/testDosen1.png",
      }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listTicket.length,
        itemBuilder: ((context, index) {
          final data = listTicket[index];
          if (index == 0) {
            return Column(
              children: [
                Container(
                  width: 458,
                  height: 75,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                        blurRadius: 4,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyAppMahasiswa(initialPage: 1))),
                        child: const Text(
                          "AVAILABLE",
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset("style/img/Line 2.png"),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryTicketPage())),
                        child: Text(
                          "HISTORY",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 20,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Tiket Container
                Container(
                  width: 338,
                  height: 123,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    shadows: [
                      const BoxShadow(
                        color: Color(0x3F000000),
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(left: 11, right: 11, top: 14),
                  child: Row(
                    children: [
                      Image.asset(
                        data["Gambar"]!,
                        height: 112,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 33),
                          Text(
                            data["Dosen"]!,
                            style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data["Tanggal"]}, ${data["Jam"]}",
                            style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "${data["Tujuan"]}",
                            style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(width: 140),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(70, 15),
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor:
                                          const Color.fromRGBO(39, 55, 77, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      )),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CancelTicketDialog();
                                        });
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      color: Colors.red,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              Container(
                width: 338,
                height: 123,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  shadows: [
                    const BoxShadow(
                      color: Color(0x3F000000),
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                      blurRadius: 4,
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(left: 11, right: 11, top: 14),
                child: Row(
                  children: [
                    Image.asset(
                      data["Gambar"]!,
                      height: 112,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 33),
                        Text(
                          data["Dosen"]!,
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${data["Tanggal"]}, ${data["Jam"]}",
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "${data["Tujuan"]}",
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 10,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 140),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(70, 15),
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor:
                                        const Color.fromRGBO(39, 55, 77, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    )),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CancelTicketDialog();
                                      });
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.red,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class HistoryTicketPage extends StatelessWidget {
  final List<Map<String, dynamic>> listTicket = [
    for (int i = 1; i <= 2; i++)
      {
        "Id": "ID Tiket $i",
        "Dosen": "Dosen Tiket $i",
        "Tanggal": "3 October 2023",
        "Jam": "10.00",
        "Tujuan": "Tujuan Pertemuan Tiket $i",
        "Gambar": "style/img/testDosen1.png",
        "Status": "Success",
      },
    for (int i = 3; i <= 4; i++)
      {
        "Id": "ID Tiket $i",
        "Dosen": "Dosen Tiket $i",
        "Tanggal": "3 October 2023",
        "Jam": "10.00",
        "Tujuan": "Tujuan Pertemuan Tiket $i",
        "Gambar": "style/img/testDosen1.png",
        "Status": "Not Verified",
      }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listTicket.length,
        itemBuilder: ((context, index) {
          final data = listTicket[index];
          if (index == 0) {
            return Column(
              children: [
                Container(
                  width: 458,
                  height: 75,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                        blurRadius: 4,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyAppMahasiswa(initialPage: 1))),
                        child: Text(
                          "AVAILABLE",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontFamily: 'Quicksand',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset("style/img/Line 2.png"),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryTicketPage())),
                        child: const Text(
                          "HISTORY",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Tiket Container
                Container(
                  width: 338,
                  height: 123,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    shadows: [
                      const BoxShadow(
                        color: Color(0x3F000000),
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(left: 11, right: 11, top: 14),
                  child: Row(
                    children: [
                      Image.asset(
                        data["Gambar"]!,
                        height: 112,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 33),
                          Text(
                            data["Dosen"]!,
                            style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data["Tanggal"]}, ${data["Jam"]}",
                            style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "${data["Tujuan"]}",
                            style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          Container(
                            width: 200,
                            alignment: Alignment.centerRight,
                            child: Text(
                              data["Status"],
                              style: TextStyle(
                                  color: data["Status"] == "Success"
                                      ? const Color(0xFF0165FC)
                                      : const Color(0xFFFF0000),
                                  fontFamily: 'Quicksand',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              Container(
                width: 338,
                height: 123,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  shadows: [
                    const BoxShadow(
                      color: Color(0x3F000000),
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                      blurRadius: 4,
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(left: 11, right: 11, top: 14),
                child: Row(
                  children: [
                    Image.asset(
                      data["Gambar"]!,
                      height: 112,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 33),
                        Text(
                          data["Dosen"]!,
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${data["Tanggal"]}, ${data["Jam"]}",
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "${data["Tujuan"]}",
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Container(
                          width: 200,
                          alignment: Alignment.centerRight,
                          child: Text(
                            data["Status"],
                            style: TextStyle(
                                color: data["Status"] == "Success"
                                    ? const Color(0xFF0165FC)
                                    : const Color(0xFFFF0000),
                                fontFamily: 'Quicksand',
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

////PAGE TEST/////
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
