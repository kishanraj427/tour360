import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:tour360/utils/palatte.dart';

class ViewScreen extends StatefulWidget {
  final String url, search;
  const ViewScreen({super.key, required this.url, required this.search});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PanoramaViewer(
            interactive: true,
            sensitivity: 1,
            child: Image.network(widget.url),
            onImageLoad: () {
              isLoading = false;
              if (mounted) setState(() {});
            },
          ),
          if (isLoading) getLoader(),
          SafeArea(
            child: Container(
              color: Colors.black45,
              height: 64,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Palatte.white,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.search,
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Palatte.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  getLoader() {
    return Center(
      child: Lottie.asset("assets/loading2.json",
          width: MediaQuery.of(context).size.width),
    );
  }
}
