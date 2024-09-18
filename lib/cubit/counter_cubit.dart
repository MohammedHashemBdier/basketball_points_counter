import 'package:basketball_points_counter/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(
          CounterState.initial(),
        );

  int teamAPoints = 0;
  int teamBPoints = 0;
  void teamIncrement({
    required String teamAorB,
    required int buttonNumber,
  }) {
    if (teamAorB == "A") {
      teamAPoints += buttonNumber;
      emit(CounterTeamAIncrementState());
    } else if (teamAorB == "B") {
      teamBPoints += buttonNumber;
      emit(CounterTeamBIncrementState());
    }
  }

  void reset() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(CounterResetState());
  }
}
