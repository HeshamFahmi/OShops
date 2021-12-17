// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, deprecated_member_use, avoid_print, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shop_app/modules/login/log_in_form.dart';
import 'package:shop_app/modules/signup/sign_up_form.dart';
import 'package:shop_app/screens/search_screen.dart';

import 'fakeCategories.dart';
import 'fakeProductDetails.dart';

class FakeHomePage extends StatefulWidget {
  const FakeHomePage({Key? key}) : super(key: key);

  @override
  State<FakeHomePage> createState() => _FakeHomePageState();
}

class _FakeHomePageState extends State<FakeHomePage> {
  var productsName = ["Onion", "Pepsi", "Strawberry", "T-Shirt"];
  var productsPrice = ["3.5", "4.75", "8.88888", "50.564"];
  var productsImages = [
    "https://produits.bienmanger.com/34833-0w600h600_Organic_Yellow_Onion.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3cgQozJzrS0TY2nmjomBxkDYb36vZ1hO8ww&usqp=CAU",
    "https://calloways.com/wp-content/uploads/strawberry-plant-0773401340.jpg",
    "https://m.media-amazon.com/images/I/61MSZWTT3IL._UY550_.jpg"
  ];
  var productsRate = ["0.0", "0.0", "0.0", "0.0"];

  var storeName = ["Spinneys", "lulu", "Carrefour", "Amazon"];

  var storeImages = [
    "https://spinneys-egypt.com/vendor/spinneys/assets/images/big_logo.png",
    "https://www.filloffer.com/storage/resized_ahr0chm6ly9hc2hpywutynvja2v0lnmzlmv1lxdlc3qtmy5hbwf6b25hd3muy29tl2zpbgvzl1dyte16uetvdexnuek4nlbvmk9smu9hzlv2ree1elnacxo1yjfrb1uucg5n.png",
    "https://sharkiatoday.com/wp-content/uploads/2020/06/%D8%AA%D8%B7%D8%A8%D9%8A%D9%82-%D9%83%D8%A7%D8%B1%D9%81%D9%88%D8%B1-MAF-Carrefour-..-%D8%B7%D8%B1%D9%8A%D9%82%D8%A9-%D8%A7%D9%84%D8%AA%D8%AD%D9%85%D9%8A%D9%84-%D9%88%D9%83%D9%8A%D9%81%D9%8A%D8%A9-%D8%A7%D9%84%D8%B4%D8%B1%D8%A7%D8%A1-%D8%A3%D9%88%D9%86-%D9%84%D8%A7%D9%8A%D9%86.jpg",
    "http://www.equiti.com/media/11666/amazon.jpg"
  ];

  final BannerAd myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.mediumRectangle,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    _initGoogleMobileAds();
    myBanner.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildColumn(BuildContext context, screen, url, name, price) {
      return Container(
        margin: EdgeInsets.all(10.0),
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => screen));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  url,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(name,
                  style: TextStyle(fontSize: 19),
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              price + '\$',
              style: TextStyle(fontSize: 19, color: Colors.green),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Oshops",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.5),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SearchScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.black,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: const [
                  Text(
                    'Stores',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 135,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: storeName.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 80,
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FakeCategoriesScreen(),
                                ));
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(storeImages[index]),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(storeName[index])
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: AdWidget(ad: myBanner),
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: productsName.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildColumn(
                        context,
                        FakeProductDetailsScreen(
                          productName: productsName[index],
                          productImageUrl: productsImages[index],
                          productPrice: productsPrice[index],
                          productRate: productsRate[index],
                        ),
                        productsImages[index],
                        productsName[index],
                        productsPrice[index]);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen("hhhh"),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(15.0),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen("hhhhh"),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(15.0),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Register",
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
          ],
        ),
      ),
    );
  }

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}
