import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Score Bar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ScoreColor(),
    );
  }
}
class ScoreColor extends StatelessWidget {
  const ScoreColor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Bar'),
      ),
      body: const Center(
        child: ScoreCard(title: "My score in Flutter"),
      ),
    );
  }
}
class ScoreCard extends StatefulWidget {
  final String title;

  const ScoreCard({Key? key, required this.title}) : super(key: key);
  @override
  _ScoreCardState createState() => _ScoreCardState();
}
class _ScoreCardState extends State<ScoreCard> {
  int score = 1;
  void incrementScore() {
    setState(() {
      if (score < 10) score++;
    });
  }
  void decrementScore() {
    setState(() {
      if (score > 1) score--;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = score > 5
        ? [Colors.green, Colors.green[900]!]
        : [Colors.green, Colors.green[300]!];
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: decrementScore,
                icon: const Icon(Icons.remove),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: score / 10,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: incrementScore,
                icon: const Icon(Icons.add),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "$score",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
