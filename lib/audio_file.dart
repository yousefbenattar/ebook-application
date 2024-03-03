import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

class AudioFile extends StatefulWidget {
const AudioFile({super.key,required this.advancePlayer,required this.path});
final String path ;
final AudioPlayer advancePlayer ;
  @override
  State<AudioFile> createState() => _AudioFileState();
}
class _AudioFileState extends State<AudioFile> {
Duration _duration = const Duration();
Duration _position =const Duration();
bool isPlaying = false ;  
bool isPause = false ;
bool isRepeat = false ;

Color color = Colors.black;
@override
  void initState() {
    super.initState();
    widget.advancePlayer.onDurationChanged.listen((d) {setState(() {_duration = d;});});
    widget.advancePlayer.onPositionChanged.listen((p) {setState(() {_position = p;});});
    widget.advancePlayer.setSourceAsset(widget.path);
    widget.advancePlayer.onPlayerComplete.listen((event) {setState(() {
        _position = Duration.zero;
        if(isRepeat ==true){isPlaying = false;}
        else if(isRepeat ==false){isPlaying = false;}
      }); });
  }

Widget slider() {
    return Slider(
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.advancePlayer.seek(newDuration);
  }
    Widget btnStart() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying == false
          ? const Icon(
              Icons.play_circle_fill,
              size: 30,
            )
          : const Icon(Icons.pause_circle_filled, size: 30),
      onPressed: () {
        if (isPlaying == false) {
       widget.advancePlayer.play(AssetSource(widget.path));
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          widget.advancePlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
    );
  }
  Widget btnStop() {
    return IconButton(
        //padding:const EdgeInsets.only(bottom: 10),
        onPressed: () {
          setState(() {
             widget.advancePlayer.stop();
          });
        },
        icon: const Icon(Icons.pause_circle_filled, size: 30),);
  }
  Widget faster() {
    return IconButton(
      //padding: const EdgeInsets.only(bottom: 10),
      onPressed: () {
        widget.advancePlayer.setPlaybackRate(1.5);
      },
      icon: const ImageIcon(AssetImage('assets/forward.png'), size: 20),
    );
  }
  Widget slower() {
    return IconButton(
     // padding: const EdgeInsets.only(bottom: 10),
      onPressed: () {
        widget.advancePlayer.setPlaybackRate(0.5);
      },
      icon: const ImageIcon(AssetImage('assets/backword.png'), size: 20),
    );
  }
    Widget looop() {
    return IconButton(
      //padding: const EdgeInsets.only(bottom: 10),
      onPressed: () {

      },
      icon: const ImageIcon(AssetImage('assets/loop.png'), size: 20),
    );
  }
  Widget repeat() {
    return IconButton(
    //  padding: const EdgeInsets.only(bottom: 10),
      onPressed: () {
        if (isRepeat == false) {
          widget.advancePlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isRepeat = true;
            color = Colors.blue;
          });
        } else if (isRepeat == true) {
          setState(() {
            widget.advancePlayer.setReleaseMode(ReleaseMode.release);
            color = Colors.black;
            isRepeat == false;
          });
        }
      },
      icon: ImageIcon(
        const AssetImage(
          'assets/repeat.png',
        ),
        color: color, size: 20
      ),
    );
  }

  Widget loadAsset() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         repeat(),
          slower(),
          btnStart(),
          faster(),
          looop()
        ],
      ),
    );
  }
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _position.toString().split('.')[0],
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              _duration.toString().split('.')[0],
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        slider(),
        loadAsset(),
      ],
    );
  }
}
