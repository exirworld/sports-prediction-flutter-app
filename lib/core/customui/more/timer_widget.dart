import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/Timer/bloc/timer_bloc.dart';

class TimerWidget extends StatefulWidget {
  final Function() onTap;
  final bool isLoading;
  const TimerWidget({super.key, required this.onTap, required this.isLoading});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  void initState() {
    BlocProvider.of<TimerBloc>(context).add(Start());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return state.seconds > 0
            ? SmallBoldText(
                "${state.timerPresenter}  Seconds to resend code",
                textColorInLight: const Color(0xff02629F),
              )
            : GestureDetector(
                onTap: widget.onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SmallBoldText(
                      "Resend the code",
                      textColorInLight: Color(0xff02629F),
                    ),
                    const HorizontalSpace(horizantal_spacing_1x),
                    widget.isLoading
                        ? const CupertinoActivityIndicator(
                            color: Color(0xff02629F),
                          )
                        : const Icon(
                            CupertinoIcons.refresh,
                            color: Color(0xff02629F),
                            size: 20,
                          ),
                  ],
                ),
              );
      },
    );
  }
}
