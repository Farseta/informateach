import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(), // Memulai dengan halaman Sign In
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Hi! Welcome back, you have been missed',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
              ),
            ),
            SizedBox(height: 45),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your username!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your password!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 42.5),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                print('Sign In Function');
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
                  backgroundColor: Color.fromRGBO(39, 55, 77, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Text(
                'Sign In',
                style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Row(
                children: [
                  Text(
                    'Do not have an account?',
                    style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: Text(
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
            Container(margin: EdgeInsets.only(top:135), child: Text(
              'Register',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),),
            Text(
              'Fill your information below',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
              ),
            ),
            SizedBox(height: 45),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your name!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your NIM!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your phone number!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your new username!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your new password!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm your new password!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityQuestionPage()));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
                  backgroundColor: Color.fromRGBO(39, 55, 77, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Text(
                'Security Question',
                style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Row(
                children: [
                  Text(
                    'Do you have an account?',
                    style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 135,),
          ],
        ),
      ),
      )
    );  }
}


class SecurityQuestionPage extends StatefulWidget{
  @override
  _SecurityQuestionPageState createState() => _SecurityQuestionPageState();
}
class _SecurityQuestionPageState extends State<SecurityQuestionPage>{
  List<String> listPertanyaan =["siapa nama bapakmu?","siapa nama ibumu?","udah ada yang punya belum?"]; 
  String nPertanyaan = "siapa nama bapakmu?";
  int? nilaiPertanyaan;
 
 void pilihPertanyaan(String value){
  setState((){
    nPertanyaan =value;   
  });
 }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,children: [
            Text(
              'Security Question',
              style:TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ) ,
            ),
            Text(
              'Answer the question below',
              style:TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
              ) ,
            ),
            SizedBox(height: 45),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose which question you want!',
                  style:TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ) ,
                ),
              ),
            ),
            SizedBox(height: 10),
            
            Container(
              margin: const EdgeInsets.only(left: 43.5,right: 42.5),
              child: DropdownButtonFormField <String>(
              value: nPertanyaan, 
              onChanged: (String ? value){
                pilihPertanyaan(value??"");
                nilaiPertanyaan =listPertanyaan.indexOf(value??"");
              }, items: listPertanyaan.map(
                (String value){
                  return DropdownMenuItem(
                    child: Text(value,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 17,
                    ),
                    ),
                    value: value,
                    
                  );
                }
              ).toList(),
              decoration: InputDecoration(
                labelText: 'choose your question',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
              ),
              
              ),
              
            ),
            SizedBox(height: 45,),
            Container(
              margin: EdgeInsets.only(left: 42.5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Answer',
                  style:TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                  ) ,
                ),
              ),
            
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 42.5, right: 42.5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Insert your answer!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                print("submit sequrity question");
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                  left: 80,right: 80,top: 10,bottom: 10
                ),
                backgroundColor: Color.fromRGBO(39, 55, 77, 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                ),
                ),
            ),
          ],
        )
        ),

    );
  }
}

class ForgotPasswordPage extends StatefulWidget{
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isVisible = false;
  void toggleVisibility(){
    setState(() {
      isVisible = !isVisible;
    });
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Forgot Password'
              ,style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              ),
              Text('are you forgot your password',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
              ),
              ),
              SizedBox(height: 45,),
              Container(
                margin: EdgeInsets.only(left: 42.5),
                child: Visibility(
                  visible: !isVisible,
                  child:Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'siapa nama bapakmu?',
                        style:TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17,
                        ) ,
                      ),
                    ), 
                  ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 42.5, right: 42.5),
                child: Row(
                  children: [
                    Visibility(
                      visible: !isVisible,
                      child: Container(
                          margin: EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width*0.5,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Insert your answer!',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    
                    SizedBox(width: 10,),
                    Visibility(
                      visible: !isVisible,
                      child: ElevatedButton(
                          onPressed: (){
                            toggleVisibility();
                            print("submit sequrity question");
                          },
                          
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(39, 55, 77, 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            
                            minimumSize:Size(100, 65),
                          ), 
                          child: Text('submit'),
                        ),
                      ),
                  ],
                )
              ),
              // SizedBox(height: 15,),
              Container(
                // margin: EdgeInsets.only(left: 42.5),
                child: Column(
                  children: [
                    Visibility(
                      visible: isVisible,
                      child: Container(
                        margin: EdgeInsets.only(right: 230),
                        child: Text("new password!",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 17,
                        ),
                        ),

                    ),
                    ),
                    SizedBox(height:10),
                    Visibility(
                      visible: isVisible,
                      child: Container(
                        margin: EdgeInsets.only(left: 42.5, right: 42.5),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Insert your new password!',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: ElevatedButton(
                        onPressed: (){
                          print("change password");

                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                            left: 80,right: 80,top: 10,bottom: 10
                          ),
                          backgroundColor: Color.fromRGBO(39, 55, 77, 1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text("Change Password",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20,
                        ),
                        ),

                      ),
                      )


                  ],
                  ),
                
              ),
              
            ],
           ),
      ),
    );
  }
}