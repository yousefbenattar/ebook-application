import 'package:asmr_application/models/books.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data.dart';
import 'audio_file.dart';
class AudioPage extends StatefulWidget {
  const AudioPage({super.key,required this.book,});
  final Books book ;

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
late AudioPlayer advancePlayer ;

@override
initState(){
  super.initState();
  advancePlayer = AudioPlayer();
}
  @override
  Widget build(BuildContext context) {
    final double apphight = MediaQuery.of(context).size.height;
    final double appwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: apphight / 3,
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
              )),
          Positioned(
              left: 1,
              right: 3,
              top: 0,
              child: AppBar(
                backgroundColor: Colors.blue,
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      advancePlayer.stop();
                      },
                       icon:const  Icon(Icons.arrow_back,color: Colors.white,)),
                actions: [
                  IconButton(onPressed: () {

                  }, icon: const Icon(Icons.search,color: Colors.white,))
                ],
                elevation: 0.0,
              )),
          Positioned( 
          right: 0,
          left: 0,
          height: apphight/2.5,
          top: apphight /4,
          child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36)),
                    child: Column(children: [
                      Text(widget.book.title),
                      SizedBox(height: apphight*0.1,),
                      Text(widget.book.title,
                      style:const TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,fontFamily: 'Avenir'),),
                      Text(widget.book.text,
                      style:const TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,fontFamily: 'Avenir'),),
                    AudioFile(
                    advancePlayer: advancePlayer,path : widget.book.audio),
                    ],),
              ))
                  ,Positioned(
            left: appwidth/3,
            right: appwidth/3,
            top: apphight*0.16,
            height: apphight*0.15,
            
            child: Container(
              decoration:  BoxDecoration(border: Border.all(color: Colors.white,width: 5),
              color:audioBlueBackground,borderRadius: BorderRadius.circular(8)),
              child: CircleAvatar(
                backgroundImage:AssetImage(widget.book.img),radius: 1,))),
        ],
      ),
    );
  }
}
