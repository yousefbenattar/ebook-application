import 'package:flutter/material.dart';

class LtTab extends StatelessWidget {
  const LtTab({super.key,required this.name,required this.color});
final String name ;
final Color color ;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      height: 45,
      width: 100,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 8)),
          ]),
      child:  Text(name,
          style:const TextStyle(fontSize: 15, color: Colors.black)),
    );
  }
}
