import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:informateach/dosen/landingPage.dart';
import 'package:informateach/dosen/navbarConnected/profile.dart';
import 'package:informateach/utils.dart';

class EditProfileDosen extends StatefulWidget {
  const EditProfileDosen({super.key});

  @override
  State<EditProfileDosen> createState() => _EditProfileDosenState();
}

class _EditProfileDosenState extends State<EditProfileDosen> {
  late TextEditingController _nameController,
      _phoneController,
      _nipController,
      _genderController,
      _emailController;

  void selectImage() async {
    Uint8List selectedImg = await pickImage(ImageSource.gallery);
    setState(() {
      img = selectedImg;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: dosenNow["Email"]);
    _nameController = TextEditingController(text: dosenNow["Name"]);
    _nipController = TextEditingController(text: dosenNow["NIP"]);
    _phoneController = TextEditingController(text: dosenNow["Phone"]);
    _genderController = TextEditingController(text: dosenNow["Gender"]);
  }

  @override
  Widget build(BuildContext context) {
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
                img != null
                    ? Container(
                        margin: const EdgeInsets.only(top: 44),
                        child: ClipOval(
                          child: Image.memory(
                            img!,
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

            //Email Dosen Container
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
                controller: _emailController,
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //Name Dosen Container
            Container(
                margin: const EdgeInsets.only(left: 28),
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
                enabled: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //NIP Dosen Container
            Container(
                margin: const EdgeInsets.only(left: 28),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "NIP",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: TextField(
                controller: _nipController,
                enabled: true,
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
                enabled: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //Gender Dosen Container
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
                enabled: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 68,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const EditProfilePage()));
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginPage()));
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
            ),
            SizedBox(
              height: 160,
            )
          ],
        ),
      ),
    );
  }
}
