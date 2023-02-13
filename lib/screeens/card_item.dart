import 'package:flutter/material.dart';
import 'package:maxway_clone/models/Products.dart';

class CardItem extends StatelessWidget {
  final Product product;
  final Function()? onTap;

  const CardItem({
    Key? key,
    required this.product,
    required  this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 114,
                width: double.infinity,
                decoration:BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(fit:BoxFit.fill,image: NetworkImage("https://maxway.uz/_next/image?url=https%3A%2F%2Fcdn.delever.uz%2Fdelever%2F${product.image}&w=1920&q=75")),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  product.title.ru,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffE7E9E8),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.opaque,
                    child:  Center(child: Text("${product.outPrice}  сум")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String oldPrice;
  final String priceTagName;

  const _Image({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.priceTagName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: NetworkImage(imageUrl),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                price != oldPrice
                    ? Text(
                        oldPrice,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(),
                Text(price),
              ],
            ),
            // width: 100,
            // height: ,
          ),
        ),
        price != oldPrice
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    priceTagName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
