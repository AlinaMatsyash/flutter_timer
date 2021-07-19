import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [ Color(0xffb4dfef),Color(0xffb4dfef)],
                  [ Color(0xff8795bc),Color(0xff8795bc)],
                  [ Color(0xff9eadd9),Color(0xff9eadd9)],
                  [ Color(0xff9dcae3),Color(0xff9dcae3)],
                ],
                durations: [32000, 21000, 10800, 5000],
                heightPercentages: [0.25, 0.26, 0.28, 0.31],
                blur: MaskFilter.blur(BlurStyle.solid, 0),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              backgroundColor: Color(0xffb4dfef),
              size: Size(double.infinity, double.infinity),
            ),
          ),
        Container(
          height: MediaQuery.of(context).size.height - 230,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff9dcae3),
                Color(0xff42497a),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
