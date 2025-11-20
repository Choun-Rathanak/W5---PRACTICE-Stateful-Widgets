import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Score Bar Exercise'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: ScoreList(),
        ),
      ),
    );
  }
}


class ScoreList extends StatelessWidget {
  const ScoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ScoreCard(title: 'My score in Flutter'),
        SizedBox(height: 16),
        ScoreCard(title: 'My score in Dart'),
        SizedBox(height: 16),
        ScoreCard(title: 'My score in React'),
      ],
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;

  const ScoreCard({super.key, required this.title});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 3;

  void increaseScore() {
    setState(() {
      if (score < 10) score++;
    });
  }

  void decreaseScore() {
    setState(() {
      if (score > 1) score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: decreaseScore,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: score / 10,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: increaseScore,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
