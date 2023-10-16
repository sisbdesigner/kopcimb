import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopcimb/Dashboard.dart';
import 'package:kopcimb/Login.dart';
import 'package:kopcimb/Registration.dart';
import 'package:kopcimb/OTP.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);


  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final passwordContorller = TextEditingController();
  final RepasswordContorller = TextEditingController();
  bool visible = true;
  bool visible2 = true;

  late Timer countdownTimer; // Initialize countdownTimer as non-null

  @override
  void dispose() {
    countdownTimer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _showOTPDialog(BuildContext context) {
    const int timerDuration = 60;

    StreamController<int> timerStreamController = StreamController<int>();


    void startCountdown() {
      countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        int remainingTime = timerDuration - timer.tick;
        timerStreamController.add(remainingTime);

        if (remainingTime <= 0) {
          countdownTimer.cancel();
          Navigator.of(context).pop();
        }
      });
    }

    startCountdown();

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: AlertDialog(
              content: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sahkan KOD OTP',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 20),
                      textAlign: TextAlign.center,
                    ),

                    Text('Nombor OTP anda telah dihantar melalui sms ke nmbr **** 9781', style: GoogleFonts.inter(fontSize: 12),textAlign: TextAlign.center,),

                    OTP(),

                    StreamBuilder<int>(
                      stream: timerStreamController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.active) {
                          return Text(
                            ' ${snapshot.data ?? timerDuration} seconds',
                            style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Color(0xff81040A)),
                            textAlign: TextAlign.center,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),


                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const Dashboard();}));
                        countdownTimer.cancel();
                      },

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xff81040A)), // Change the button color
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Change the button shape (rounded corners)
                        )),
                      ),
                      child: Text('Sahkan OTP',style: GoogleFonts.inter(color: Colors.white),),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('tidak mendapat OTP? ',style: GoogleFonts.inter(fontSize: 12),),

                        Text('Hantar semula', style: GoogleFonts.inter(fontSize:12,color: Colors.red),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background pixel cropped.png'),fit: BoxFit.cover)
      ),
      child: SafeArea(
      child: Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back,size: 30,),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
             ],
          ),
        ),


        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Padding(
              padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1),
              child: Center(child: Image.asset('assets/kopcimb-logo-red.png'),),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.14,vertical: MediaQuery.of(context).size.height * 0.02),
              child: Text('Lupa Password', style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 20),),
            ),

            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.14,top: MediaQuery.of(context).size.height * 0.07),
              child: Row(
                children: [

                   Container(child: Image.asset('assets/padlock.png',height: MediaQuery.of(context).size.height * 0.03,)),

                  SizedBox(width: 10.0),

                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black)
                      )
                    ),
                    child: TextFormField(
                      obscureText: visible,
                      controller: RepasswordContorller,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: "Kata Laluan Baharu",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              visible = !visible; // Toggle between obscured and visible
                            });
                          },
                          child: Icon(
                              visible ? Icons.visibility_outlined : Icons.visibility_off_outlined, // Use different icons for obscured and visible states
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.14, top: MediaQuery.of(context).size.height * 0.04),
              child: Row(
                children: [

                  Container(child: Image.asset('assets/padlock.png',height: MediaQuery.of(context).size.height * 0.03,)),

                  SizedBox(width: 10.0),

                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black)
                        )
                    ),
                    child: TextFormField(
                      obscureText: visible2,
                      controller: RepasswordContorller,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: "Konfirmkan Kata Laluan",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              visible2 = !visible2; // Toggle between obscured and visible
                            });
                          },
                          child: Icon(
                              visible2 ? Icons.visibility_outlined : Icons.visibility_off_outlined, // Use different icons for obscured and visible states
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: ()  {
                if (passwordContorller.text.isNotEmpty && RepasswordContorller.text.isNotEmpty){

                if(passwordContorller.text == RepasswordContorller.text){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Login();
                }));
                }

                else {
                  // Passwords don't match, show a toast message
                  Fluttertoast.showToast(
                    msg: "Kata laluan tidak sepadan",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white70,
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                }}

                else if(passwordContorller.text.isEmpty){
                  Fluttertoast.showToast(
                      msg: "Sila masukkan Kata laluan baharu",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white70,
                      textColor: Colors.black,
                      fontSize: 16.0
                  );                  }

                else if (RepasswordContorller.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: "Sila masukkan kata laluan baharu",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white70,
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                }
              },
              child: Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08, bottom: MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.14),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff81040A)

                  ),
                  height: 50,
                  width:  MediaQuery.of(context).size.width * 0.77,
                  child: Center(child: Text('Reset New Password',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold

                        )
                    ),)),

                ),
              ),
            ),

          ],
        ),

    )));
  }
}
