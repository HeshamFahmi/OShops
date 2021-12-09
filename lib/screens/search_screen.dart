import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> products = [];
  TextEditingController textEditingController = new TextEditingController();
  bool loading = false;
  searchItem(String param) async {
    loading = true;
    products.clear();
    await CacheHelper.init();
    var access_token = CacheHelper.getData(key: 'access_token');
    var headers = {'Authorization': 'Bearer $access_token'};
    var request = http.Request(
      'GET',
      Uri.parse('https://oshops-app.herokuapp.com/productSearch?search=$param'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var items = json.decode(await response.stream.bytesToString());
      //print(items);
      //ItemsModel model = ItemsModel.fromJson(items);
      print(items["data"]);
      items["data"].forEach((element) {
        products.add(element);
      });
      print(products.length);
      setState(() {
        loading = false;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Find your items",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "Please Write What you want",
                  prefixIcon: GestureDetector(
                      onTap: () async {
                        searchItem(textEditingController.text.toString());
                        // await CacheHelper.init();
                        // var access_token =
                        //     CacheHelper.getData(key: 'access_token');
                        // print("the token is $access_token");
                        // ApiServicesCubit.getInstance(context).searchItem(
                        //   token: access_token,
                        //   param: item!,
                        // );
                      },
                      child: Icon(Icons.search)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              loading
                  ? Center(child: CircularProgressIndicator())
                  : products.isEmpty
                      ? Container(
                          margin: EdgeInsets.all(20.0),
                          width: double.infinity,
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "there is no item with this name .... please try again",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(10.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        products[index]["productImageURL"],
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products[index]["productName"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        products[index]["price"].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )

              // Container(
              //   height: 100,
              //   width: 100,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       TextField(
              //         decoration: InputDecoration(
              //           hintText: 'search about your items',
              //           prefixIcon: Icon(
              //             Icons.search,
              //             color: Colors.black,
              //             size: 18,
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5.0),
              //             borderSide: BorderSide(
              //               color: Colors.grey,
              //               width: 0.4,
              //             ),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5.0),
              //             borderSide: BorderSide(
              //               color: Colors.grey,
              //               width: 0.4,
              //             ),
              //           ),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5.0),
              //             borderSide: BorderSide(
              //               color: Colors.grey,
              //               width: 0.4,
              //             ),
              //           ),
              //         ),
              //         onChanged: (value) {
              //           setState(() {
              //             item = value.toString();
              //           });
              //         },
              //       ),
              //       InkWell(
              //         onTap: () async {
              //           await CacheHelper.init();
              //           var access_token =
              //               CacheHelper.getData(key: 'access_token');
              //           print("the token is $access_token");
              //           ApiServicesCubit.getInstance(context).searchItem(
              //             token: access_token,
              //             param: item!,
              //           );
              //         },
              //         child: BlocBuilder<ApiServicesCubit, ApiServicesStates>(
              //           builder: (context, state) {
              //             if (state is SearchItemFoundState) {
              //               products = state.items;
              //               products
              //                   .sort(); // sort items from shotest to longest
              //             } else if (state is SearchItemNotFoundState) {
              //               ToastConstant.showToast(context, state.error);
              //             }
              //             return Icon(
              //               Icons.search,
              //               color: Colors.white,
              //               size: 20,
              //             );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              ///**
              /// هشام هنا هتعمل ليست فيو ويدجيت وتنادي فيها علي اللسته
              ///  بعد معملتلها سورت هتلاقيها فوق سطر 109
              /// وبعد كدا هترسم شكل للداتا بس دا كل الي هتعمله هنا
              /// */
            ],
          ),
        ),
      ),
    );
  }
}
