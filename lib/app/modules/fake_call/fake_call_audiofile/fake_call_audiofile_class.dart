import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FakeCallAudioFile extends StatefulWidget {
  final String audioasset;
  final AudioPlayer player;
  const FakeCallAudioFile({Key? key, required this.audioasset, required this.player,}) : super(key: key);

  @override
  State<FakeCallAudioFile> createState() => _FakeCallAudioFileState();
}

class _FakeCallAudioFileState extends State<FakeCallAudioFile> {

  int maxduration = 100;
  String currentpostlabel = "00:00";
  String audioasset = "";
  bool isplaying = false;
  bool audioplayed = false;
  int currentpos = 0;
  late Uint8List audiobytes;

  //AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      audioasset = widget.audioasset;
      ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
      audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      widget.player.onDurationChanged.listen((Duration d) { //get the duration of audio
        maxduration = d.inMilliseconds;
        setState(() {

        });
      });

      widget.player.onPositionChanged.listen((Duration  p){
        currentpos = p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds:currentpos).inHours;
        int sminutes = Duration(milliseconds:currentpos).inMinutes;
        int sseconds = Duration(milliseconds:currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenDivision=MediaQuery.of(context).size.height*(2/5);
    return WillPopScope (
      onWillPop: () async {
        if(isplaying || audioplayed) {
          await widget.player.stop();
            setState(() {
              isplaying = false;
              audioplayed = false;
            });
        }
        return Future.value(true);
      },
      child: Column(
      children: [
        SizedBox(
          height: screenDivision/5,
          child: Wrap(
            spacing: 10,
            children: [
              IconButton(
                onPressed: () async {
                  if (!isplaying && !audioplayed) {
                    try {
                      await widget.player.play(BytesSource(audiobytes));
                      setState(() {
                        isplaying = true;
                        audioplayed = true;
                      });
                    } catch (e) {
                      print("Error while playing audio: $e");
                    }
                  }
                  else if (audioplayed && !isplaying) {
                    try {
                      await widget.player.resume();
                      setState(() {
                        isplaying = true;
                        audioplayed = true;
                      });
                    } catch (e) {
                      print("Error on resume audio: $e");
                    }
                  }
                  else {
                    try {
                      await widget.player.pause();
                      setState(() {
                        isplaying = false;
                      });
                    } catch (e) {
                      print("Error on pause audio: $e");
                    }
                  }
                },
                icon: Icon(isplaying?Icons.pause_circle_filled:Icons.play_circle_fill),
                iconSize: (screenDivision/5)*(5/6),
                color: const Color(0xff7D7A7A),
              ),
            ],
          ),
        ),
        SizedBox(
            height: screenDivision/5,
            child: Slider(
              activeColor: const Color(0xff646060),
              inactiveColor: const Color(0xffD9D9D9),
              value: double.parse(currentpos.toString()),
              min: 0,
              max: double.parse(maxduration.toString()),
              divisions: maxduration,
              label: currentpostlabel,
                onChanged: (double value) async {
                  try {
                    int seekval = value.round();
                    await widget.player.seek(Duration(milliseconds: seekval));
                    setState(() {
                      currentpos = seekval;
                    });
                  } catch (e) {
                    print("Seek unsuccessful: $e");
                  }
                },
            )
        ),
        Container(
          height: screenDivision/5,
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentpostlabel, style: TextStyle(fontSize: (screenDivision/5)*(1/4)),
              ),
              IconButton(
                onPressed: () async {
                  try {
                    await widget.player.stop();
                    setState(() {
                      isplaying = false;
                      audioplayed = false;
                      currentpos = 0;
                    });
                  } catch (e) {
                    print("Error on stop audio: $e");
                  }
                },
                icon: const Icon(Icons.replay_circle_filled_rounded),
                iconSize: (screenDivision/5)*(3/5),
                color: const Color(0xff7D7A7A),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}