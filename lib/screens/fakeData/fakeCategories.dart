// ignore_for_file: use_key_in_widget_constructors, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'fakeProducts.dart';

class FakeCategoriesScreen extends StatefulWidget {
  @override
  State<FakeCategoriesScreen> createState() => _FakeCategoriesScreenState();
}

class _FakeCategoriesScreenState extends State<FakeCategoriesScreen> {
  var categoriesName = ["Groceries & more", "Electronics", "Makeup", "Cars"];

  var categoriesImages = [
    "https://www.safefood.net/getmedia/bdd2f336-d2a3-455e-899a-621b084d38cc/shopping-trolley.jpg?w=1200&h=675&ext=.jpg&width=1360&resizemode=force",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKI1KbR09pnz2E_V27LopU8Rl4EN1J4QNlvQ&usqp=CAU",
    "https://images-na.ssl-images-amazon.com/images/I/51O1IDYXubL.jpg",
    "https://www.motortrend.com/uploads/sites/5/2019/12/MotorTrend-Most-Important-Cars-of-the-Decade.jpg?fit=around%7C875:492"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white10,
          title: const Text(
            'Categories',
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
          physics: const BouncingScrollPhysics(),
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                categoriesName.length,
                (index) {
                  return buildColumn(context, categoriesName[index],
                      categoriesImages[index], index);
                },
              )),
        ));
  }

  Column buildColumn(
      BuildContext context, String? name, String? imageUrl, int? index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FakeProductScreen(),
                ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              imageUrl!,
              width: 100,
              height: 100,
            ),
          ),
        ),
        Text(name!,
            style: const TextStyle(fontSize: 19),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
