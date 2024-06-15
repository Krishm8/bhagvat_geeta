import 'package:bhagvat_geeta/controller/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cd =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider value, Widget? child) {
              return InkWell(
                  onTap: () {
                    value.favorite.add(cd);
                    value.favbutton=Icons.favorite;
                  },
                  child: Icon(value.favbutton==Icons.favorite_border?Icons.favorite_border:Icons.favorite));
            },
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "assets/krishna.png",
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "CHAPTER ${cd["chap_no"]}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      cd["chap_name"],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Center(
                    child: Text(
                      "${cd["slock"]}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 100),
                  Text(
                    "Gist",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${cd["gist_hin"]}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Meaning",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${cd["meaning_hin"]}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
