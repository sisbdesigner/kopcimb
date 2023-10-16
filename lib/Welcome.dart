import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:kopcimb/Login.dart';
import 'package:kopcimb/Registration.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background pixel cropped.png'),fit: BoxFit.cover)
      ),
        child: Scaffold(
        backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.center,

              children: [


                Center(child: Image.asset('assets/kopcimb-logo-red.png')),

                const Padding(padding: EdgeInsets.only(bottom: 150)),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Container(
                      decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 0.5,
                                  offset: Offset (0,4),
                                  color: Colors.grey
                              )
                            ],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              width: 2,
                              color: Color(0xffE2d3E2),
                            )
                        ),
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('Kami Beli',
                              style: GoogleFonts.inter(
                                  color: Color(0xff81040A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold

                              )),

                          Padding(padding: EdgeInsets.all(3)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/arrow.png',height: 18,color: Colors.red,),

                              Padding(padding: EdgeInsets.only(right: 5)),

                              Text('256.1',
                                  style: GoogleFonts.inter(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold

                                  )),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(3)),

                          Text('per Grm',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 8,
                              )),
                        ],
                      )
                    ),

                    const Padding(padding: EdgeInsets.only(left: 15, right: 15)),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 0.5,
                            offset: Offset (0,4),
                            color: Colors.grey
                          )
                        ],
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 2,
                          color: Color(0xffE2d3E2),
                        )
                      ),
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('Kami Jual',
                          style: GoogleFonts.inter(
                            color: Color(0xff81040A),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )),

                          Padding(padding: EdgeInsets.all(3)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Transform.rotate(angle: 3.14159,
                              child: Image.asset('assets/arrow.png',height: 18,color: Colors.greenAccent,)),
                              Padding(padding: EdgeInsets.only(right: 5)),
                              Text('269.24',
                                  style: GoogleFonts.inter(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold

                                  )),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(3)),

                          Text('per Gram',
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                fontSize: 8,
                              )),
                        ],
                      ))]
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      GestureDetector(
                        onTap: () async{
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Registration();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xff81040A),
                              width: 2
                            ),

                          ),
                          height: 40,
                          width:  MediaQuery.of(context).size.width * 0.4,
                          child: Center(child: Text('Daftar',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Color(0xff81040A),
                                fontSize: 14,
                                  fontWeight: FontWeight.bold

                              )
                            ),)),

                        ),
                      ),

                      const Padding(padding: EdgeInsets.only(left: 10, right: 10)),

                      GestureDetector(
                        onTap: () async{
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Login();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                                color: Color(0xff81040A),
                          ),
                          height: 40,
                          width:  MediaQuery.of(context).size.width * 0.4,
                          child: Center(child: Text('Log Masuk',
                            style:  GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),)),
                          )),
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
