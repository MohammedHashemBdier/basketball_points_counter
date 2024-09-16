import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BasketballPointsCounter());
}

class BasketballPointsCounter extends StatefulWidget {
  const BasketballPointsCounter({super.key});

  @override
  State<BasketballPointsCounter> createState() =>
      _BasketballPointsCounterState();
}

class _BasketballPointsCounterState extends State<BasketballPointsCounter> {
  int teamAPoints = 0;

  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Points Counter'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      const Text(
                        'Team "A"',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'Ubuntu'),
                      ),
                      Text(
                        '$teamAPoints',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 150,
                            fontFamily: 'Ubuntu'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            minimumSize: const Size(100, 40)),
                        onPressed: () {
                          teamAPoints += 1;
                          setState(() {});
                        },
                        child: const Text(
                          'Add 1 Point',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            minimumSize: const Size(100, 40)),
                        onPressed: () {
                          teamAPoints += 2;
                          setState(() {});
                        },
                        child: const Text(
                          'Add 2 Point',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            minimumSize: const Size(100, 40)),
                        onPressed: () {
                          teamAPoints += 3;
                          setState(() {});
                        },
                        child: const Text(
                          'Add 3 Point',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                  child: VerticalDivider(
                    endIndent: 60,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      const Text(
                        'Team "B"',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'Ubuntu'),
                      ),
                      Text(
                        '$teamBPoints',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 150,
                            fontFamily: 'Ubuntu'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            minimumSize: const Size(100, 40)),
                        onPressed: () {
                          setState(() {
                            teamBPoints++;
                          });
                        },
                        child: const Text(
                          'Add 1 Point',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            minimumSize: const Size(100, 40)),
                        onPressed: () {
                          setState(() {
                            teamBPoints += 2;
                          });
                        },
                        child: const Text(
                          'Add 2 Point',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            minimumSize: const Size(100, 40)),
                        onPressed: () {
                          setState(() {
                            teamBPoints += 3;
                          });
                        },
                        child: const Text(
                          'Add 3 Point',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(160, 50)),
              onPressed: () {
                setState(() {
                  teamAPoints = 0;
                  teamBPoints = 0;
                });
              },
              child: const Text(
                'Reset',
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontFamily: 'Ubuntu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
