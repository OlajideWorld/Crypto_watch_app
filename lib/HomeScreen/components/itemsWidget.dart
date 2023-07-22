// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/utils/sizes.dart';

class ItemsDisplay extends StatelessWidget {
  var items;
  ItemsDisplay({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Image.network(items.image)
      ]),
    );
  }
}
