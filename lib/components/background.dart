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
                  [ Colors.pink.shade400,Colors.white70,],
                  [ Colors.pink.shade300,Colors.white54,],
                 [ Colors.pink.shade200,Colors.white30,],
                  [ Colors.pink.shade50,Colors.pink.shade50],

                ],
                durations: [32000, 21000, 10800, 5000],
                heightPercentages: [0.25, 0.26, 0.28, 0.31],
                blur: MaskFilter.blur(BlurStyle.solid, 0),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              backgroundColor: Colors.white,
              size: Size(double.infinity, double.infinity),
            ),
          ),
        Container(
          height: MediaQuery.of(context).size.height - 230,
          color:  Colors.pink.shade50,
        )
      ],
    );
  }
}
