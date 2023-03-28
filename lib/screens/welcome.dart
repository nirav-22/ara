import 'package:ara/backend/AuthProvider.dart';
import 'package:ara/screens/home.dart';
import 'package:ara/screens/otp.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  TextEditingController _phone = TextEditingController();
  Country selectCountry = Country(phoneCode: '91', countryCode: 'IN', e164Sc: 0, geographic: true, level:1, name: 'India', example: 'India', displayName: 'India', displayNameNoCountryCode: 'IN', e164Key:'');

  @override
  Widget build(BuildContext context) {

    _phone.selection = TextSelection.fromPosition(TextPosition(offset: _phone.text.length));

    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
                child: Image(image: AssetImage('images/ara_welcome.jpg'),height: 380,)
            ),

            Container(

              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text('Ara Jewellery',
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'Inspiration',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white
                      )
                      ,),

                    SizedBox(height: 15),

                    Text(' Jewellery that reflects Y O U ',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cinzel',
                          color: Colors.purpleAccent
                      ),),

                    SizedBox(height: 20),

                    Text('Login / Sign Up',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),

                    Text('Enter mobile number for OTP',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Hind',
                          color: Colors.white
                      ),),


                    //OTP TEXTFIELD CDOE
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        color: Colors.black,
                        margin: EdgeInsets.all(2),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (value){
                            setState(() {
                              _phone.text = value;
                            });
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(

                            hintText: 'Enter your phone number.',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white)
                            ),
                            suffixIcon: _phone.text.length > 9
                                ? Container(
                              margin: const EdgeInsets.all(10),
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(Icons.done,color: Colors.white,size: 20,),
                            ) :null,
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(2),
                              child: InkWell(
                                onTap: (){
                                  // for country
                                  showCountryPicker(context: context,
                                      countryListTheme: const CountryListThemeData(bottomSheetHeight: 500),
                                      onSelect: (value){
                                    setState(() {
                                      selectCountry = value;
                                    });
                                  });

                                },

                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('${selectCountry.flagEmoji} +${selectCountry.phoneCode}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),
                            ),
                          ),

                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          controller: _phone,
                        ),
                      ),
                    ),



                    Row(
                      children: [
                        Expanded(
                          child: Container(

                            height: 40,
                            width: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.redAccent,
                                      Colors.purple
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft
                                )
                            ),
                            child: TextButton(
                              onPressed: (){
                                sendPhoneNumber();

                              },
                              child: Text('Request OTP',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                            ),
                          ),
                        ),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have account?',style: TextStyle(color: Colors.white,),),
                        TextButton(
                            onPressed: () async{

                              try {
                                final userCredential =
                                    await FirebaseAuth.instance.signInAnonymously();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Home(),
                                  ),
                                );
                                print("Signed in with temporary account.");
                              } on FirebaseAuthException catch (e) {
                                switch (e.code) {
                                  case "operation-not-allowed":
                                    print("Anonymous auth hasn't been enabled for this project.");
                                    break;
                                  default:
                                    print("Unknown error.");
                                }
                              }

                            },
                            child: Text('Continue as Guest',style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontStyle: FontStyle.italic,decoration: TextDecoration.underline),)),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    )
    );
  }
  void sendPhoneNumber(){
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = _phone.text.trim();
    ap.signInWithPhone(context, "+${selectCountry.phoneCode}$phoneNumber");

  }
}
