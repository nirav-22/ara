import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List _bannerImage = [];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  getBanner(){
    return _firestore.collection('banners').get().then((QuerySnapshot qwerySnapshot){
      qwerySnapshot.docs.forEach((doc){
        setState(() {
          _bannerImage.add(doc['image']);
        });
      });
    });
  }

  @override
  void initState(){
    getBanner();
    super.initState();
  }

  List imageList = [
    {"id": 1, "image_path": 'images/1.jpg'},
    {"id": 2, "image_path": 'images/2.jpg'},
    {"id": 3, "image_path": 'images/3.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [

            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(10)
              ),
              child: PageView.builder(
                itemCount: _bannerImage.length,
                itemBuilder: (context, index){
                  return Image.network(_bannerImage[index],
                  fit:BoxFit.cover);
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: Colors.pink[50],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          ImageIcon(AssetImage('images/certificate.png'),size: 20,),
                          Column(
                            children: [
                              Text('100% Certified',style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),),
                              Text('Jewellery',style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Row(
                        children: [
                          ImageIcon(AssetImage('images/refund.png'),size: 20,),
                          Column(
                            children: [
                              Text('100% Refund',style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),),
                              Text('and Insurance',style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Row(
                        children: [
                          ImageIcon(AssetImage('images/exchange.png'),size: 20,),
                          Column(
                            children: [
                              Text('Lifetime Exchange',style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),),
                              Text('and BuyBack',style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                )
            ),

            SizedBox(
              height: 10,
            ),

            Text('Categories', style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Hind'

            ),),

            Padding(
              padding: const EdgeInsets.only(bottom: 5,right: 5,left: 5),
              child: Column(

                children: [

                  Row(

                    children: [

                      Card(
                        color: Colors.pink[50],
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('images/MALE.png',width: MediaQuery.of(context).size.width/2-20,),
                            ),

                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [

                                Text('Men',style: TextStyle(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.w500
                                ),),

                                SizedBox(width: 50,),

                                Text('Explore',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),),

                                Icon( Icons.arrow_forward_ios,size: 12)

                              ],
                            )

                          ],
                        ),
                      ),

                      SizedBox(width: 10,),

                      Card(
                        color: Colors.pink[50],
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('images/KID.png',width: MediaQuery.of(context).size.width/2-20,),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [

                                Text('Kids',style: TextStyle(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.w500
                                ),),

                                SizedBox(width: 50,),

                                Text('Explore',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),),
                                Icon( Icons.arrow_forward_ios,size: 12)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Card(
                    color: Colors.pink[50],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage('images/female.jpg'),width: MediaQuery.of(context).size.width,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Women',style: TextStyle(
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.w500
                              ),),

                              Row(
                                children: [
                                  Text('Explore',style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12
                                  ),),
                                  Icon( Icons.arrow_forward_ios,size: 12,)
                                ],
                              ),
                            ],)
                        ],
                      ),
                    ),
                  )

                ],

              ),
            )

          ],
        ),
      ),
    );
  }
}
