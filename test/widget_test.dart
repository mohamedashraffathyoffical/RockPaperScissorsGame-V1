import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(RockPaperScissorsGame());
}

class RockPaperScissorsGame extends StatefulWidget {
  const RockPaperScissorsGame({super.key});

  @override
  _RockPaperScissorsGameState createState() => _RockPaperScissorsGameState();
}

class _RockPaperScissorsGameState extends State<RockPaperScissorsGame> {
  final List<String> choices = ["🪨", "📄", "✂️"];
  String playerChoice = "";
  String computerChoice = "";
  String resultMessage = "اختر واحدًا للبدء!";
  int playerScore = 0;
  int computerScore = 0;

  void playGame(String playerSelection) {
    setState(() {
      playerChoice = playerSelection;
      computerChoice = choices[Random().nextInt(3)];

      if (playerChoice == computerChoice) {
        resultMessage = "تعادل! 😐";
      } else if (
        (playerChoice == "🪨" && computerChoice == "✂️") ||
        (playerChoice == "📄" && computerChoice == "🪨") ||
        (playerChoice == "✂️" && computerChoice == "📄")
      ) {
        resultMessage = "أنت فزت! 🎉";
        playerScore++;
      } else {
        resultMessage = "الكمبيوتر فاز! 😢";
        computerScore++;
      }
    });
  }

  void resetGame() {
    setState(() {
      playerChoice = "";
      computerChoice = "";
      resultMessage = "اختر واحدًا للبدء!";
      playerScore = 0;
      computerScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ورقة - حجر - مقص"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("النتيجة", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("أنت: $playerScore - الكمبيوتر: $computerScore", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(resultMessage, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("اختيارك: $playerChoice", style: TextStyle(fontSize: 22)),
            Text("اختيار الكمبيوتر: $computerChoice", style: TextStyle(fontSize: 22)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: choices.map((choice) {
                return GestureDetector(
                  onTap: () => playGame(choice),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(choice, style: TextStyle(fontSize: 50)),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: resetGame,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text("إعادة تعيين النتيجة"),
            ),
          ],
        ),
      ),
    );
  }
}