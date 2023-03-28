import 'package:ara/components/my_nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);



  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  List imageList = [
    {"id": 1, "image_path": 'images/1.jpg'},
    {"id": 2, "image_path": 'images/2.jpg'},
    {"id": 3, "image_path": 'images/3.jpg'},
    {"id": 4, "image_path": 'images/MALE.png'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),

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
                child: Icon(Icons.shopping_cart)
            ),
          )
        ],
        backgroundColor: Colors.purple[900],
      ),

      body: SingleChildScrollView(
        child: Container(
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
                        aspectRatio: 1.5,

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
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                ],
              ),



              Padding(
                padding: const EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Ara Gold and silver assceory for all age and sex.',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Hind',
                      ),),

                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Row(
                  children: [
                    Text('Product ID: 123465789'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 8,left: 8,top: 4,bottom: 4),
                child: Container(
                  color: Colors.pink[50],
                  child: Row(

                    children: [
                      Icon(Icons.currency_rupee,size: 30,),
                      Text('40000',style: TextStyle(fontSize: 30),),


                    ],
                  ),
                ),
              ),

              Card(

                child: ExpansionTile(
                  title: Text('Price Break-up'),
                  subtitle: Text('(Gold rate, Making charge etc)'),
                  children: <Widget>[

                    DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                ' Breakdown',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Amount',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),

                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('gold rate')),
                              DataCell(Text('19')),

                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('gold weight')),
                              DataCell(Text('43')),

                            ],
                          ),



                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('total',style: TextStyle(fontWeight: FontWeight.bold),)),
                              DataCell(Text('12546')),

                            ],
                          ),
                        ],
                    )

                  ],
                ),
              ),

              Card(

                child: ExpansionTile(
                  title: Text('Details'),

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Jewellery is usually worn as small decorative items for personal adornment such as rings, brooches, necklaces, earrings and necklaces. For many centuries metal has been often combined with various gemstones to make jewellery. Jewellery is usually made from a wide range of materials. Gemstones and similar materials such as amber and coral, precious metals, beads, and shells have been widely used, and enamelling technique has been applied.'),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar:  Row(
          children: [
            Container(width: MediaQuery.of(context).size.width/2,height: 40,decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),color: Colors.pink[500]
            ),
            child: Center(child: Text('Add to cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),),
            Container(width: MediaQuery.of(context).size.width/2,height: 40,decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10)),color: Colors.purple,
            ),
              child: Center(child: Text('Buy now',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),)
          ],
        ),
      
    );
  }
}
