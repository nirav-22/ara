import 'package:ara/components/my_nav_bar.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[50],
      child: Stack(
          children: [SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(width: MediaQuery.of(context).size.width,height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Gold Rate 10 gm: 55000',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),

                      Text('Silver Rate 10 gm: 650',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                ),

                Text('My Cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(

                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(image: AssetImage('images/MALE.png'),height: 100,),
                              SizedBox(width: 8,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text('Ara gold  everyone and sex ',style: TextStyle(
                                          fontFamily: 'Hind',
                                          fontSize: 20
                                      ),
                                      ),

                                      Text('\u{20B9} 236589',style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Hind',
                                      ),),
                                      RichText(text:TextSpan(
                                          text: 'Quantity: ',
                                          style: TextStyle(fontSize: 20,fontFamily: 'Hind',color: Colors.black),
                                          children: const <TextSpan>[
                                            TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold)),]

                                      )),
                                      RichText(text:TextSpan(
                                          text: 'Gold Weight: ',
                                          style: TextStyle(fontSize: 20,fontFamily: 'Hind',color: Colors.black),
                                          children: const <TextSpan>[
                                            TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold)),]

                                      ))

                                    ],),
                                ),
                              )
                            ],
                          ),




                          Divider(height: 8,thickness: 4,),
                          Row(children: [
                            Expanded(
                              child: Container(
                                height: 30,
                                color: Colors.red.withOpacity(.5),
                                child: Center(
                                  child: Text('Remove'),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text('Move to Wishlist'),
                                ),
                              ),
                            ),
                          ],)


                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(

                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Image(image: AssetImage('images/MALE.png'),height: 100,),
                                  SizedBox(height: 5,),
                                  Text('ID: 123456')
                                ],
                              ),
                              SizedBox(width: 8,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text('Ara gold  everyone and sex cjch ufviluv uvkv vi ugvu ',style: TextStyle(
                                          fontFamily: 'Hind',
                                          fontSize: 20
                                      ),
                                      ),

                                      Text('\u{20B9} 236589',style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Hind',
                                      ),),
                                      RichText(text:TextSpan(
                                          text: 'Quantity: ',
                                          style: TextStyle(fontSize: 20,fontFamily: 'Hind',color: Colors.black),
                                          children: const <TextSpan>[
                                            TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold)),]

                                      )),
                                      RichText(text:TextSpan(
                                          text: 'Gold Weight: ',
                                          style: TextStyle(fontSize: 20,fontFamily: 'Hind',color: Colors.black),
                                          children: const <TextSpan>[
                                            TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold)),]

                                      ))

                                    ],),
                                ),
                              )
                            ],
                          ),




                          Divider(height: 8,thickness: 4,),
                          Row(children: [
                            Expanded(
                              child: Container(

                                height: 30,
                                color: Colors.red.withOpacity(.5),
                                child: Center(
                                  child: Text('Remove'),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text('Move to Wishlist'),
                                ),
                              ),
                            ),
                          ],)


                        ],
                      ),
                    ),
                  ),
                ),



                Divider(
                  height: 10,
                  color: Colors.black,
                  thickness: 5,

                ),
                Text('Order Summary',style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Hind'
                ),),

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
                        DataCell(Text('Total',style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataCell(Text('\u{20B9} 12546')),

                      ],
                    ),
                  ],
                ),

                Text('*Inclusive of all taxes'),
                Container(width: MediaQuery.of(context).size.width,height: 55,color: Colors.pink[50],),

              ],
            ),
          ),

            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: Text('Proceed to Pay'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Hind')),
              ),
            )

          ]),
    );
  }
}
