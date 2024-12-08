import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:tour360/screens/homescreen.dart';
import 'package:tour360/utils/palatte.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Palatte.green));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();
  final SERP_API_KEY =
      "705495a4f3eb241f8b7e7300d788c3b9bdba162d07efe98922b43204bb640900";
  final API_KEY = "AIzaSyAIEqDeiR42WR7DBC8I1SpCZULB3d9YX7o";
  final cx = "37c3a95a0c6e74f1a";
  final query = "Taj Mahal panoramic image";
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    try {
      var res = await dio.get(
          "https://customsearch.googleapis.com/customsearch/v1?key=${API_KEY}&searchType=image&imgSize=HUGE&q=${query}&cx=${cx}");
      // var res = await dio.get(
      //     'https://serpapi.com/search.json?engine=google_images&q=${query}&api_key=${API_KEY}');
      print(res);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            body: PanoramaViewer(
          interactive: true,
          sensitivity: 1,
          child: Image.network(
              'https://th.bing.com/th/id/R.696dce4e836dc42a02b69750b5f0775b?rik=HpNJ0F5n9vHBsQ&riu=http%3a%2f%2fcdn.lightgalleries.net%2f4bd5ec0f44d0a%2fimages%2ftaj_mahal_india_panorama_stunning_sunrise-1.jpg&ehk=B6vSFrKSnfJepARZ61BUwZlcJcqGxfFbmJruN3tB%2bDc%3d&risl=&pid=ImgRaw&r=0'),
        )),
        Lottie.asset('assets/loading2.json')
      ],
    );
  }
}
