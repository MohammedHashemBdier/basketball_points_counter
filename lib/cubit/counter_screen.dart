import 'package:basketball_points_counter/cubit/counter_cubit.dart';
import 'package:basketball_points_counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            title: const Text('Points Counter'),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return _buildWideLayout(context);
              } else {
                return _buildNarrowLayout(context);
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildTeamColumn(context, "A")),
              const SizedBox(
                height: double.infinity,
                child: VerticalDivider(
                  endIndent: 60,
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Expanded(child: _buildTeamColumn(context, "B")),
            ],
          ),
        ),
        _buildResetButton(context),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTeamColumn(context, "A"),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          _buildTeamColumn(context, "B"),
          _buildResetButton(context),
        ],
      ),
    );
  }

  Widget _buildTeamColumn(BuildContext context, String team) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Team "$team"',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            '${team == "A" ? context.read<CounterCubit>().teamAPoints : context.read<CounterCubit>().teamBPoints}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 20),
          _buildPointButton(context, team, 1),
          const SizedBox(height: 10),
          _buildPointButton(context, team, 2),
          const SizedBox(height: 10),
          _buildPointButton(context, team, 3),
        ],
      ),
    );
  }

  Widget _buildPointButton(BuildContext context, String team, int points) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrangeAccent,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {
          context.read<CounterCubit>().teamIncrement(
                teamAorB: team,
                buttonNumber: points,
              );
        },
        child: Text(
          'Add $points Point${points > 1 ? 's' : ''}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            context.read<CounterCubit>().reset();
          },
          child: const Text(
            'Reset',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
      ),
    );
  }
}
