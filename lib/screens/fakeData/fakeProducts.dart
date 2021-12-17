// ignore_for_file: use_key_in_widget_constructors, avoid_print, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/log_in_form.dart';
import 'package:shop_app/screens/fakeData/fakeProductDetails.dart';

class FakeProductScreen extends StatefulWidget {
  @override
  State<FakeProductScreen> createState() => _FakeProductScreenState();
}

class _FakeProductScreenState extends State<FakeProductScreen> {
  var productsName = ["Onion", "Pepsi", "Strawberry", "T-Shirt"];
  var productsPrice = ["3.5", "4.75", "8.88888", "50.564"];
  var productsImages = [
    "https://produits.bienmanger.com/34833-0w600h600_Organic_Yellow_Onion.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3cgQozJzrS0TY2nmjomBxkDYb36vZ1hO8ww&usqp=CAU",
    "https://calloways.com/wp-content/uploads/strawberry-plant-0773401340.jpg",
    "https://m.media-amazon.com/images/I/61MSZWTT3IL._UY550_.jpg"
  ];
  var productsRate = ["0.0", "0.0", "0.0", "0.0"];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white10,
          title: const Text(
            'Products',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Wrap(
              children: List.generate(productsName.length, (index) {
            return Wrap(children: [
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.45,
                child: buildColumn(
                  context,
                  productsName[index],
                  productsImages[index],
                  productsPrice[index],
                  productsRate[index],
                  index,
                ),
              ),
            ]);
          })),
        ));
  }

  Widget buildColumn(BuildContext context, String? name, String? imageUrl,
      String? price, String? rate, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FakeProductDetailsScreen(
                      productName: name!,
                      productImageUrl: imageUrl!,
                      productPrice: price!,
                      productRate: rate!,
                    )));
      },
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              imageUrl!,
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Text(name!,
                    style: const TextStyle(fontSize: 19),
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                price! + " \$",
                style: const TextStyle(fontSize: 20, color: Colors.blue),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Alert'),
                  content: const Text('You Must Login First'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen("hhhh"),
                            ),
                          );
                        },
                        child: const Text('Go To Login')),
                  ],
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(15.0),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Add To Card",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
