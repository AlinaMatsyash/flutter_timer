import 'package:flutter/material.dart';
import 'package:flutter_timer/components/background.dart';
import 'package:flutter_timer/components/timer_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/timer/timer.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb4dfef),
        elevation: 0,
        title: const Text('Flutter Timer', style: TextStyle(color: Color(0xff3e3f72)),),
      ),
      body: Stack(
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              Actions(),
            ],
          )
        ],
      ),
    );
  }
}


class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                backgroundColor: Color(0xff3e3f72),
                child: Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration)),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                backgroundColor: Color(0xff3e3f72),
                child: Icon(Icons.pause),
                onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
              ),
              FloatingActionButton(
                  backgroundColor: Color(0xff3e3f72),
                  child: Icon(Icons.replay),
                  onPressed: () => context.read<TimerBloc>().add(TimerReset())),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                backgroundColor: Color(0xff3e3f72),
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
              ),
              FloatingActionButton(
                backgroundColor: Color(0xff3e3f72),
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                backgroundColor: Color(0xff3e3f72),
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),),
            ]
          ],
        );
      },
    );
  }
}
