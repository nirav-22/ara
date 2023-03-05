import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(

        children: [
          Container(
              child: Image(image: AssetImage('images/ara_welcome.jpg'))
          ),

          Expanded(
            child: Container(

              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Text('Ara Jewellery',
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'Inspiration',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white
                      )
                      ,),

                    SizedBox(height: 20),

                    Text(' Jewellery that reflects Y O U ',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cinzel',
                          color: Colors.purpleAccent
                      ),),

                    SizedBox(height: 60),

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
                              onPressed: (){},
                              child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                            ),


                          ),
                        ),

                        Expanded(child: Container(

                          height: 40,
                          width: 100,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.purple
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft
                              )
                          ),
                          child: TextButton(
                            onPressed: (){},
                            child: Text('SignUp',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                          ),


                        ))



                      ],
                    ),
                    SizedBox(height: 20,),
                    TextButton(
                        onPressed: (){},
                        child: Text('Continue as Guest',style: TextStyle(color: Colors.blueAccent,fontSize: 20,fontStyle: FontStyle.italic,decoration: TextDecoration.underline),))

                  ],
                ),
              ),
            ),
          ),

        ],
      ),

    )
    );
  }
}
