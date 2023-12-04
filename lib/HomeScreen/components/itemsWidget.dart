// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter_crypto_app/common/custom_text.dart';
import 'package:flutter_crypto_app/utils/sizes.dart';

class ItemsDisplay extends StatelessWidget {
  var items;
  final double height;
  final double width;
  ItemsDisplay({
    Key? key,
    required this.items,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: height * 0.05,
                child: Image.network(items.image),
              ),
            ),
            SizedBox(width: width * 0.03),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    text: items.id,
                    size: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  CText(
                      text: "0.4 ${items.symbol}",
                      size: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)
                ],
              ),
            ),
            SizedBox(width: width * 0.01),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: height * 0.05,
                // width: width * 0.2,
                child: Sparkline(
                  data: items.sparklineIn7D.price,
                  lineWidth: widthSize(2.0),
                  lineColor: items.marketCapChangePercentage24H >= 0
                      ? Colors.green
                      : Colors.red,
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.7],
                      colors: items.marketCapChangePercentage24H >= 0
                          ? [Colors.green, Colors.green.shade100]
                          : [Colors.red, Colors.red.shade100]),
                ),
              ),
            ),
            SizedBox(width: width * 0.08),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  text: "\$ ${items.currentPrice.toString()}",
                  size: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                SizedBox(
                  child: Row(children: [
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
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
