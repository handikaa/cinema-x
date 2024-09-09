import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> promotionList(
  List<String> promotionImage,
) =>
    [
      Padding(
        padding: const EdgeInsets.only(
          left: 24,
          bottom: 15,
        ),
        child: Text(
          'Promotion',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: promotionImage
              .map(
                (e) => Hero(
                  tag: e,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: e == promotionImage.first ? 24 : 10,
                        right: e == promotionImage.last ? 10 : 0),
                    width: 240,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                      image: DecorationImage(
                        image: AssetImage(e),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      )
    ];
