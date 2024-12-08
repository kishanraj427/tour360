// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour360/models/place.dart';
import 'package:tour360/screens/search_list_screen.dart';
import 'package:tour360/utils/palatte.dart';
import 'package:tour360/utils/store.dart';
import 'package:tour360/utils/strings.dart';

class MostSearched extends StatelessWidget {
  const MostSearched({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            Strings.topSearches,
            style: GoogleFonts.playpenSans(shadows: <Shadow>[
              const Shadow(
                  offset: Offset(1, 1), blurRadius: 2.0, color: Colors.black12),
            ], color: Palatte.green, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                for (Place place in mostSearchedPalces)
                  MostSearchedItem(place: place)
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MostSearchedItem extends StatelessWidget {
  MostSearchedItem({super.key, required this.place});
  Place place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(SearchListScreen(search: place.name));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(1, 1))
            ]),
        margin: const EdgeInsets.only(right: 15, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                fit: BoxFit.fill,
                width: 200,
                height: 125,
                imageUrl: place.image,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  place.name,
                  style: GoogleFonts.ubuntu(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
