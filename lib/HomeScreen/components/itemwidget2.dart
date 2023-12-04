// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/common/custom_text.dart';
import 'package:get/get.dart';

class ItemWidget2 extends StatelessWidget {
  var items;
  final double height;
  final double width;
  ItemWidget2({
    Key? key,
    required this.items,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.02),
      child: Container(
        padding: EdgeInsets.only(
            left: width * 0.03,
            right: height * 0.06,
            top: height * 0.02,
            bottom: height * 0.02),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: height * 0.035,
            child: Image.network(items.image),
          ),
          SizedBox(height: height * 0.02),
          CText(
            text: items.id,
            color: Colors.black,
            size: 18,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: height * 0.01),
          Row(
            children: [
              CText(
                text: "\$ ${items.priceChange24H.toStringAsFixed(2)}",
                size: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              SizedBox(width: width * 0.03),
              CText(
                text:
                    "${items.marketCapChangePercentage24H.toStringAsFixed(2)} %",
                size: 16,
                fontWeight: FontWeight.normal,
                color: items.marketCapChangePercentage24H >= 0
                    ? Colors.green
                    : Colors.red,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
