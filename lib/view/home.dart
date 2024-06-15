import 'package:bhagvat_geeta/controller/home_provider.dart';
import 'package:bhagvat_geeta/controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).jfun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhagvat Gita"),
        actions: [
          Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider value, Widget? child) {
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container();
                    },
                  );
                },
                child: Icon(Icons.favorite));
            },
          ),
          SizedBox(width: 15),
          Consumer<ThemeProvider>(
            builder:
                (BuildContext context, ThemeProvider value, Widget? child) {
              return InkWell(
                onTap: () {
                  value.changetheme();
                },
                child: Icon(value.theme == ThemeMode.light
                    ? Icons.light_mode
                    : Icons.dark_mode),
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: Image.asset(
                  "assets/1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Chapters",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Consumer<HomeProvider>(
                builder:
                    (BuildContext context, HomeProvider value, Widget? child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.clist.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = value.clist[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "detail",
                              arguments: value.clist[index]);
                        },
                        child: ListTile(
                          leading: Text("${item["chap_no"]}",
                              style: TextStyle(fontSize: 18)),
                          title: Text(item["chap_name"] ?? ""),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

