abstract class CounterState {
  static CounterState initial() {
    return CounterTeamAIncrementState();
  }
}

class CounterTeamAIncrementState extends CounterState {}

class CounterTeamBIncrementState extends CounterState {}

class CounterResetState extends CounterState {}
