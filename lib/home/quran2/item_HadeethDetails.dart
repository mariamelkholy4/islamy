import 'package:flutter/material.dart';
class ItemHadeethDetails extends StatelessWidget {
  String content;

  ItemHadeethDetails({required this.content });

  @override
  Widget build(BuildContext context) {
    return  Text(
      content,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl
      ,style:Theme.of(context).textTheme.bodySmall ,);

  }
}