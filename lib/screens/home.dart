import 'package:ara/components/My_drawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  List imageList = [
    {"id": 1, "image_path": 'images/1.jpg'},
    {"id": 2, "image_path": 'images/2.jpg'},
    {"id": 3, "image_path": 'images/3.jpg'}
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(

            title: Text('Ara',style: TextStyle(
                fontFamily: 'Inspiration',
                fontSize: 45,
                fontWeight: FontWeight.bold
            ),),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: (){},
                  child: Image(image: AssetImage('images/whatsapp.png'),
                    height: 40,
                    width: 40,),
                ),
              )
            ],
            backgroundColor: Colors.purple[900],
          ),

          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [

                  Stack(
                    children: [
                      InkWell(
                        onTap: (){
                          print(currentIndex);
                        },
                        child: CarouselSlider(
                          items: imageList
                              .map(
                                (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,

                              width: double.infinity,
                            ),
                          )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 2,

                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => carouselController.animateToPage(entry.key),
                              child: Container(
                                width: currentIndex == entry.key ? 17 : 7,
                                height: 7.0,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3.0,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentIndex == entry.key
                                        ? Colors.deepPurpleAccent
                                        : Colors.purple),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.cyanAccent,
                  ),

                  SizedBox(
                    height: 10,
                  ),

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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                Image(image: AssetImage('images/female.jpg'),width: MediaQuery.of(context).size.width,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30,left: 30,top: 2,bottom: 2),
                                  child: Row(children: [
                                    Text('Women',style: TextStyle(
                                        color: Colors.red[900],
                                        fontWeight: FontWeight.w500
                                    ),),

                                    SizedBox(width: 202,),

                                    Text('Explore',style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12

                                    ),),

                                    Icon( Icons.arrow_forward_ios,size: 12,)

                                  ],),
                                )
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
          ),

          drawer: NavBar(),

        );
  }
}
