import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopcimb/Dashboard.dart';
import 'package:kopcimb/OTP.dart';

 class Upload extends StatefulWidget {
   const Upload({Key? key}) : super(key: key);

   @override
   State<Upload> createState() => _UploadState();
 }


class _UploadState extends State<Upload> {

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
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey.withOpacity(0.4),

             ),
             child: IconButton(
               icon: Icon(Icons.arrow_back),
               color: Colors.black,
               onPressed: () {
                 Navigator.of(context).pop();
               },
             ),
           ),
         ),
         title: Text('Pendaftaran',style: GoogleFonts.inter(color: Colors.black54),),
       ),

       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         
         children: [
           
           Center(child: Image.asset('assets/kopcimb-logo-red.png'),),

           const Padding(padding: EdgeInsets.all(10.0)),

           Padding(
             padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.14),
             child: Text('Pendaftaran', style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
           ),

           Padding(
             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.14, top: MediaQuery.of(context).size.height* 0.01,),
             child: Text('Muat Naik Dokumen Sokongan', style: GoogleFonts.inter(color: Colors.black),),
           ),

           const Padding(padding: EdgeInsets.all(8.0)),

           Padding(
             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.14, top: MediaQuery.of(context).size.height* 0.01,bottom: MediaQuery.of(context).size.height* 0.03),
             child: Text('NRIC / PASSPORT', style: GoogleFonts.inter(color: Colors.black),),
           ),

           Padding(
             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.14),
             child: DottedBorder(
               dashPattern: [20,3],
               child: Container(
                 width: MediaQuery.of(context).size.width * 0.75,
                 height: MediaQuery.of(context).size.height * 0.17,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       Icon(Icons.camera_alt_outlined,size: 30,),

                       SizedBox(height: 8.0),

                       Text('Tangkap Gambar', style: GoogleFonts.inter(),)

                     ],
                   )
               ),
             ),
           ),

           Padding(
             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.14, top: MediaQuery.of(context).size.height* 0.03,bottom: MediaQuery.of(context).size.height* 0.001),
             child: Text('Penyata Akaun Bank', style: GoogleFonts.inter(color: Colors.black),),
           ),

           Padding(
             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.14,top: MediaQuery.of(context).size.height * 0.02),
             child: DottedBorder(
               dashPattern: [30,2],
               child: Container(
                 width: MediaQuery.of(context).size.width * 0.75,
                 height: MediaQuery.of(context).size.height * 0.17,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     
                     Icon(Icons.camera_alt_outlined,size: 30,),

                     SizedBox(height: 8.0),

                     Text('Tangkap Gambar', style: GoogleFonts.inter(),)
                     
                   ],
                 )
               ),
             ),
           ),

           GestureDetector(
             onTap: () async {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return const Dashboard();
               }));
             },
             child: Padding(
               padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025, bottom: MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.14),
               child: GestureDetector(
                 onTap: (){
                   _showOTPDialog(context);
                 },
                 child: Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Color(0xff81040A)

                   ),
                   height: 50,
                   width:  MediaQuery.of(context).size.width * 0.77,
                   child: Center(child: Text('Muat Naik',
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
           ),
         ],

       ),
     ))
     );
   }
 }
