import 'package:ara/components/my_nav_bar.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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

      bottomNavigationBar: MyNav(),

      body: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: GridView.builder(
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10


            ),
            itemBuilder: (context, index){

              return Container(

                child: Card(
                  elevation: 10,

                  color: Colors.pink[50],
                  child: Column(
                    children: [
                      Expanded(child: Container(child: Image.asset('images/MALE.png',fit: BoxFit.cover,))),

                      Text('22 karat Ring'),

                      SizedBox(height:5),

                      Text('Rs 5000',style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),),

                    ],
                  ),

                ),

              );

            }
        ),
      )

    );
  }
}
