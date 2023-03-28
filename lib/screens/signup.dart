import 'package:ara/backend/AuthProvider.dart';
import 'package:ara/components/showSnackBar.dart';
import 'package:ara/model/user_model.dart';
import 'package:ara/screens/home.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? image;
  final nameController =TextEditingController();
  final emailController =TextEditingController();
  final addressController =TextEditingController();

  @override
  void dispose(){
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
  }

void selectImage() async{
    image = await pickImage(context);
    setState(() {});
}

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider>(context,listen: true).isLoading;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: isLoading == true
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        )
            :SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 25),
          child: Center(
            child: Column(
              children: [
               InkWell(
                 onTap: ()=>selectImage(),
                 child: image==null
                     ? const CircleAvatar(
                   backgroundColor: Colors.purpleAccent,
                   radius: 50,
                   child: Icon(Icons.account_circle,
                   size: 50,
                   color: Colors.white,
                   ),
                 ): CircleAvatar(
                   backgroundImage: FileImage(image!),
                   radius: 50,
                 ),
               ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  margin: const EdgeInsets.only(top:20),
                  child: Column(
                    children: [
                      textField(

                          hintText: 'Enter your Name',
                          icon: Icons.account_circle,
                          inputType: TextInputType.name,
                          maxLines: 1,
                          controller: nameController
                      ),
                      textField(

                          hintText: 'Enter your Email',
                          icon: Icons.email,
                          inputType: TextInputType.emailAddress,
                          maxLines: 1,
                          controller: emailController
                      ),
                      textField(
                          hintText: 'Enter your Address',
                          icon: Icons.edit,
                          inputType: TextInputType.name,
                          maxLines: 2,
                          controller: addressController
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
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
                          onPressed: ()=>storeData(),
                          child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                        ),
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller
  }){
    return Padding(padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(

      style: TextStyle(color: Colors.white,fontSize: 20),
      cursorColor: Colors.purpleAccent,
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.purpleAccent
          ),
          child: Icon(icon,size: 20,
          color: Colors.white,),
        ),
        focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.purpleAccent
              )
          ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.purpleAccent
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white,fontSize: 20),
        alignLabelWithHint: true,
        border: InputBorder.none,
        fillColor: Colors.purple.withOpacity(0.2),
        filled: true
      ),
    ),);
  }

  void storeData()async{
    final ap = Provider.of<AuthProvider>(context,listen: false);

    UserModel userModel = UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        address: addressController.text.trim(),
        profilePic: '',
        createdAt: '',
        phoneNumber: '',
        uid: ''
    );
    if(image != null){
      ap.saveUserDataToFirebase(
          context: context,
          userModel: userModel,
          profilePic: image!,
          onSuccess: (){
            // once data saved
            ap.saveUserDataToSP().then(
                  (value) => ap.setSignIn().then(
                    (value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                        (route) => false),
              ),
            );

          }
      );
    }else{
      showSnackBar(context, 'Please Upload Profile Picture');
    }

  }
}
