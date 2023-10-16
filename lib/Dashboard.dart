import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopcimb/Registration.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background pixel cropped.png'),fit: BoxFit.cover)
      ),
      child: SafeArea(
      child: Scaffold(
      backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Padding(
              padding: EdgeInsets.all( 15.0),
              child: Center(child: Image.asset('assets/kopcimb-logo-red.png',)),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Habeeb Muhammad',style: GoogleFonts.inter(color: Color(0xfffec5c7)),),

                          SizedBox(height: 8.0,),

                          Text('8909183782', style: GoogleFonts.inter(),)

                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, bottom: MediaQuery.of(context).size.height * 0.02, left: MediaQuery.of(context).size.height * 0.15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xfffec5c7),
                            borderRadius: BorderRadius.circular(10)
                          ),
                            height: MediaQuery.of(context).size.height * 0.05,

                            child: Container(
                              height: 10,
                                child: Image.asset('assets/power-button.png',color: Color(0xff81040A),))),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Center(child: Text('Harga Pasaran Emas pada: 28/9/2023'),),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffdaf3de),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Center(child: Text('KAMI BELI', style: GoogleFonts.inter(fontWeight: FontWeight.bold,color: Color(0xff2e793a)),)),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('per Gram', style: GoogleFonts.inter(color: Color(0xff2e793a)),),

                            Text('RM 288.00', style: GoogleFonts.inter(color: Color(0xff2e793a),fontWeight: FontWeight.bold),)
                          ],

                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0xfffec5c7),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.05 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Center(child: Text('KAMI JUAL', style: GoogleFonts.inter(fontWeight:FontWeight.bold ,color: Color(0xffa3393e)),)),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('per Gram', style: GoogleFonts.inter(color: Color(0xffa3393e)),),

                              Text('RM 301.11', style: GoogleFonts.inter(color: Color(0xffa3393e),fontWeight: FontWeight.bold),)
                            ],

                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
                  child: Container(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffd2c698)),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,vertical: MediaQuery.of(context).size.height * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    Text('Mengikut Harga Semasa',style: GoogleFonts.inter(),),

                                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1)),
                                    
                                    Text('905.00',style: GoogleFonts.inter(),)
                                  ],
                                ),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Mengikut Harga Belian',style: GoogleFonts.inter(),),

                                    Text('1000.21',style: GoogleFonts.inter(),)

                                  ],
                                ),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Anggaran Kerugian',style: GoogleFonts.inter(),),

                                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1)),

                                    Container(color: Color(0xfffec5c7),
                                        child: Text(' -905.00 ',style: GoogleFonts.inter(color: Color(0xffa3393e),fontWeight: FontWeight.bold),))

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(child: FractionalTranslation(
                          translation: Offset(0.6, -0.5),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0xffd2c698),
                                      width: 2)),
                            child: Center(child: Text('Nilai Emas (RM) ', style: GoogleFonts.inter(color: Color(0xffd2c698)),)),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.height * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Color(0xff81040A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('Belian',style: GoogleFonts.inter(color: Colors.white),)),

                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Color(0xff0bab7c),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('Jualan',style: GoogleFonts.inter(color: Colors.white),)),
                      ),

                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffED1B24),
                          Color(0xff81040A),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Jumlah (G) Dalam Akaun', style: GoogleFonts.inter(color: Colors.white),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('4288.00', style: GoogleFonts.inter(color: Color(0xfffcc906)),),
                            )
                          ],

                        ),

                        Image.asset('assets/gold-bars.png')

                      ],
                    ),
                  ),
                ),


              ],

            ),),

            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                color: Color(0xfff5f6f7),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/home.png', height: MediaQuery.of(context).size.height * 0.04,),
                        
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                          child: Text('Utama',style: GoogleFonts.inter(),),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/file.png', height: MediaQuery.of(context).size.height * 0.04,),

                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                          child: Text('Penyata',style: GoogleFonts.inter(),),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/notification.png', height: MediaQuery.of(context).size.height * 0.04,),

                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                          child: Text('Notifikasi',style: GoogleFonts.inter(),),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/user.png', height: MediaQuery.of(context).size.height * 0.04,),

                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                          child: Text('Profil',style: GoogleFonts.inter(),),
                        ),
                      ],
                    )





                  ],
                ),
              ),
            )


          ],
        ),
    )));

  }
}
