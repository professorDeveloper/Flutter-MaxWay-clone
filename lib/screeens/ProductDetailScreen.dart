import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Products.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

   const ProductDetailScreen({Key? key,    required this.product,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(

          children: [

            SizedBox(height: 20,),
            Row(
              children:  [
              SizedBox(width: 20,),
              InkWell(child: Icon(Icons.arrow_back_ios,color: Color(0xff130F26,),),radius: 10,onTap: (){
                Navigator.of(context).pop();
              },),
              SizedBox(width: 135,),
              Text("Акции",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17,),),
            ],),
            SizedBox(height: 27,),
            Container(
              height: 228,
              margin: EdgeInsets.only(left: 12,right: 12),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://maxway.uz/_next/image?url=https%3A%2F%2Fcdn.delever.uz%2Fdelever%2F${product.image}&w=1920&q=75"),fit: BoxFit.cover),
                color: Colors.white,

                borderRadius: BorderRadius.circular(12)
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 22,),
                Text("${product.title.ru}",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,

                ),)
              ],
            ),
            SizedBox(height: 8,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 22,),
                Expanded(
                  child: Text("${product.description.ru}",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.start,

                    style: TextStyle(
                      fontSize: 14,
                    fontWeight: FontWeight.w400,

                  ),),
                ),
                SizedBox(width: 10,)

              ],
            ),


          ],
        ),

      ),
    );
  }
}
