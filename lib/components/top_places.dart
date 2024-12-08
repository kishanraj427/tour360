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

class TopPlaces extends StatelessWidget {
  const TopPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            Strings.popularPlaces,
            style: GoogleFonts.playpenSans(shadows: <Shadow>[
              const Shadow(
                  offset: Offset(1, 1), blurRadius: 2.0, color: Colors.black12),
            ], color: Palatte.green, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: topPlaces.length,
          itemBuilder: (context, index) {
            return TopPlaceItem(place: topPlaces[index]);
          },
        )
      ],
    );
  }
}

class TopPlaceItem extends StatelessWidget {
  TopPlaceItem({super.key, required this.place});
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
                  blurRadius: 2.5,
                  spreadRadius: 2.5,
                  offset: Offset(1.5, 1.5))
            ]),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: 140,
                imageUrl: place.image,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
