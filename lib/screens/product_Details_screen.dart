// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shop_app/models/constants.dart';
import 'package:shop_app/screens/card.dart';

import 'bottom_navigator_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String productImageUrl;
  final String productPrice;
  final String productRate;
  const ProductDetailsScreen(
      {Key? key,
      required this.productName,
      required this.productImageUrl,
      required this.productPrice,
      required this.productRate})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
              color: g,
            ),
            height: 300,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(widget.productImageUrl),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //         BottomNavigationScreen(),
                                //   ),
                                // );
                              },
                              icon: const Icon(Icons.arrow_back_ios))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.productName,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Size:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'for men',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      'Color:',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      height: 30,
                      width: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price : ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.productPrice,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'Rate : ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.productRate,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // ignore: deprecated_member_use
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CardScreen()));
              },
              child: const Text(
                'add to card',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
