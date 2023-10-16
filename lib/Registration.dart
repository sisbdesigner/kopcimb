import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopcimb/Dashboard.dart';
import 'package:kopcimb/Login.dart';
import 'package:kopcimb/Upload.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);


  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final namecontroller = TextEditingController();
  final documentcontroller = TextEditingController();
  final Docnumbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final Mobilecontroller = TextEditingController();






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

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0,top: 16,bottom: 16),
          child:

              Row(
                children: [
                  Container(
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

                ],
              ),
              //SizedBox(width: 8.0),

             //Text('Pendaftaran',style: GoogleFonts.inter(color: Colors.black54),),


          ),
        ),




        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Center(child: Image.asset('assets/kopcimb-logo-red.png')),

              const Padding(padding: EdgeInsets.all(20.0)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Text('Pendaftaran', style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              ),

              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, top: MediaQuery.of(context).size.height* 0.01,bottom: MediaQuery.of(context).size.height* 0.03),
                child: Text('Daftar Pelanggan Baru', style: GoogleFonts.inter(color: Colors.black),),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1,vertical: MediaQuery.of(context).size.height*0.015),

                child: Row(
                  children: [

                    Container(child: Image.asset('assets/name.png'), height: MediaQuery.of(context).size.height* 0.03,),

                    SizedBox(width: 10.0),

                    Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          )
                      ),
                      child: TextField(
                        controller: namecontroller,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration.collapsed(hintText: "Nama"),
                      ),
                    ),                ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1,vertical: MediaQuery.of(context).size.height*0.015),

                child: Row(
                  children: [

                    Container(child: Image.asset('assets/document.png'), height: MediaQuery.of(context).size.height* 0.03,),

                    SizedBox(width: 10.0),

                    Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          )
                      ),
                      child: TextField(
                        controller: documentcontroller,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration.collapsed(hintText: "Jenis Dokumen"),
                      ),
                    ),                ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1,vertical: MediaQuery.of(context).size.height*0.015),

                child: Row(
                  children: [

                    Container(child: Image.asset('assets/number-2.png'), height: MediaQuery.of(context).size.height* 0.03,),

                    SizedBox(width: 10.0),

                    Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          )
                      ),
                      child: TextField(
                        controller: Docnumbercontroller,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration.collapsed(hintText: "Dokumen No."),
                      ),
                    ),                ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1,vertical: MediaQuery.of(context).size.height*0.015),

                child: Row(
                  children: [

                    Container(child: Image.asset('assets/mail.png'), height: MediaQuery.of(context).size.height* 0.03,),

                    SizedBox(width: 10.0),

                    Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          )
                      ),
                      child: TextField(
                        controller: emailcontroller,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration.collapsed(hintText: "Email"),
                      ),
                    ),                ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1,vertical: MediaQuery.of(context).size.height*0.015),

                child: Row(
                  children: [

                    Container(child: Image.asset('assets/telephone.png'), height: MediaQuery.of(context).size.height* 0.03,),

                    SizedBox(width: 10.0),

                    Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          )
                      ),
                      child: TextField(
                        controller: Mobilecontroller,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration.collapsed(hintText: "Mobile No."),
                      ),
                    ),                ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1,vertical: MediaQuery.of(context).size.height*0.015),

                child: Row(
                  children: [

                    Container(child: Image.asset('assets/planet-earth.png'), height: MediaQuery.of(context).size.height* 0.03,),

                    SizedBox(width: 10.0),

                    Text('Kewarganegaraan',style: GoogleFonts.inter(color: Colors.black,fontSize: 14),)
                  ],
                ),
              ),

              Row(
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07,top: MediaQuery.of(context).size.height *0.02),
                    child: Text('Dengan ini saya setuju dengan terma dan syarat ', style: GoogleFonts.inter(fontSize: 11),),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.02),
                    child: Text('Terma dan syarat', style: GoogleFonts.inter(color: Colors.red,fontSize: 11),),
                  )
                ],
              ),

              GestureDetector(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Upload();
                  }));
                },
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025, bottom: MediaQuery.of(context).size.height * 0.02),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff81040A)

                      ),
                      height: 50,
                      width:  MediaQuery.of(context).size.width * 0.8,
                      child: Center(child: Text('Teruskan',
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07,),
                    child: Text('Menyertai kami sebelum ini? ', style: GoogleFonts.inter(fontSize: 11),),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Login();
                      }));
                    },
                      child: Text('Log masuk', style: GoogleFonts.inter(color: Colors.red,fontSize: 11),))
                ],
              ),

            ],
          ),
        ),
    )),
    );
  }
}
