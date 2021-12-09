import 'package:flutter/material.dart';
import 'package:shop_app/models/constants.dart';
import 'package:shop_app/screens/product.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int num = 0;
  int price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProductScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  buildRow(),
                  const SizedBox(
                    height: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'TOTAL',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '${price} \$',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 30),
                                ),
                              ],
                            ),
                            const Spacer(),
                            FlatButton(
                                color: Colors.green,
                                onPressed: () {
                                  final alert = AlertDialog(
                                    title: Text(
                                      'Go to the website',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                    content: Container(
                                      height: 40,
                                      child: Text(
                                        'https:website.com',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 20),
                                      ),
                                    ),
                                  );
                                  showDialog(
                                      builder: (context) => alert,
                                      context: context);
                                },
                                child: Text(
                                  'Check Out',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: g,
          ),
          height: 180,
          width: 180,
          child: Image.asset('assets/images/w1.png'),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'watch',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '300\$',
              style: TextStyle(fontSize: 19, color: Colors.green),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: g,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          num++;
                          price = price + 300;
                        });
                      },
                      icon: Icon(Icons.plus_one)),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${num}',
                    style: TextStyle(fontSize: 27),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (num > 0) {
                            num--;
                            price = price - 300;
                          }
                        });
                      },
                      icon: Icon(Icons.exposure_minus_1)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
