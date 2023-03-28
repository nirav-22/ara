import 'package:ara/backend/AuthProvider.dart';
import 'package:ara/components/showSnackBar.dart';
import 'package:ara/screens/home.dart';
import 'package:ara/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPscreen extends StatefulWidget {
  final String verificationId;
  const OTPscreen({super.key, required this.verificationId});

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  String? otpcode;
  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider>(context,listen: true).isLoading;

    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: isLoading == true
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        ):Column(
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

                    Text('Enter OTP Recieved via message',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Hind',
                          color: Colors.white
                      ),),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.purpleAccent
                            )
                          ),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          )
                        ),
                        onCompleted: (value){

                          setState(() {
                            otpcode = value;
                          });

                        },
                      ),
                    ),
                    SizedBox(height: 10),

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
                                if(otpcode != null){
                                  verifyOtp(context,otpcode!);
                                }else{
                                  showSnackBar(context, 'Enter 6-digit OTP');
                                }
                              },
                              child: Text('Verify OTP',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                            ),
                          ),
                        ),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't get OTP?",style: TextStyle(color: Colors.white,),),
                        TextButton(
                            onPressed: () {},
                            child: Text('Resend OTP',style: TextStyle(color: Colors.purple[300],fontSize: 15,fontStyle: FontStyle.italic,decoration: TextDecoration.underline),)),
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

void verifyOtp(BuildContext context, String userOtp){
final ap = Provider.of<AuthProvider>(context, listen:false);
ap.verifyOtp(
    context: context,
    verificationId: widget.verificationId,
    userOtp: userOtp,
    onSuccess: (){
      ap.checkExistingUser().then((value)async{
        if (value == true){
          // user already present
          ap.getDataFromFirestore().then(
                  (value) => ap.saveUserDataToSP().then(
                    (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                          (route) => false),
                ),
              ),
          );

        }else{
          // new user
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> SignUp()), (route) => false);
        }
      });
    }
);


}


}
