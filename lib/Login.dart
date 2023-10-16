import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopcimb/Dashboard.dart';
import 'package:kopcimb/Registration.dart';
import 'ForgetPassword.dart';
import 'OTP.dart'
;import 'package:fluttertoast/fluttertoast.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {

  final IdController = TextEditingController();
  final PasswordController = TextEditingController();
  late Timer countdownTimer; // Initialize countdownTimer as non-null
  bool visible = true;

  @override
  void initState() {
    super.initState();
    countdownTimer = Timer(Duration(seconds: 0), () {}); // Initialize it here
  }

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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const ForgetPassword();}));
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16,bottom: 2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.4),

                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(child: Image.asset('assets/kopcimb-logo-red.png')),

              const Padding(padding: EdgeInsets.all(20.0)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.14,vertical: MediaQuery.of(context).size.height * 0.03),
                child: Title(color: Colors.black,
                    child: Text('Log Masuk',style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),)),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.14,vertical: MediaQuery.of(context).size.height * 0.03),
                child: Row(
                  children: [

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Image.asset('assets/name.png'),),

                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03)),

                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          )
                      ),
                      child: TextField(
                        controller: IdController,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration.collapsed(hintText: "ID Pengguna"),
                      ),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.14,),
                child: Row(
                  children: [

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Image.asset('assets/padlock.png'),),

                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03)),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          visible = !visible; // Toggle between obscured and visible
                        });
                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: TextFormField(
                          controller: PasswordController,
                          obscureText: visible,
                          decoration: InputDecoration(
                            hintText: "Kata Laluan",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  visible = !visible; // Toggle between obscured and visible
                                });
                              },
                              child: Icon(
                                visible ? Icons.visibility : Icons.visibility_off, // Use different icons for obscured and visible states
                                  color: Colors.black
                              ),
                            ),
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  _showOTPDialog(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.55,top: MediaQuery.of(context).size.height * 0.03),
                  child: Text('Lupa Kata Laluan?',style: GoogleFonts.inter(color: Colors.red),),
                ),
              ),

              GestureDetector(
                onTap: ()  {
                  if(IdController.text.isNotEmpty && PasswordController.text.isNotEmpty){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Dashboard();
                    }));


                }
                  else if(IdController.text.isEmpty){
                    Fluttertoast.showToast(
                        msg: "Sila masukkan ID",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white70,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );                  }

                  else if (PasswordController.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Sila masukkan kata laluan",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white70,
                      textColor: Colors.black,
                      fontSize: 16.0,
                    );
                  }
                  },
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff81040A)

                      ),
                      height: 50,
                      width:  MediaQuery.of(context).size.width * 0.8,
                      child: Center(child: Text('Masuk',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold

                            )
                        ),)),

                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Belum punya akaun?', style: GoogleFonts.inter(
                      color: Colors.black
                    ),),

                    GestureDetector(
                      onTap: () async{
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const Registration();
                        }));
                      },
                      child: Text(' Daftar', style: GoogleFonts.inter(
                        color: Colors.red,
                      ),),

                    ),

                  ],
                ),
              )




            ],

          ),

        ),


      ),
    );
  }





}
