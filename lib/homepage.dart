import 'package:flutter/material.dart';
import 'package:hangman/constants/colors.dart';
import 'package:hangman/utils/game.dart';
import 'package:hangman/widgets/figure_image.dart';
import 'package:hangman/widgets/letter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String word = '';
  List<String> enAlphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  List<String> arAlphabets = [
    "ح",
    "ج",
    "ث",
    "ت",
    "ب",
    "ا",
    "س",
    "ز",
    "ر",
    "ذ",
    "د",
    "خ",
    "ع",
    "ظ",
    "ط",
    "ض",
    "ص",
    "ش",
    "م",
    "ل",
    "ك",
    "ق",
    "ف",
    "غ",
    "ة",
    'ى',
    "ي",
    "و",
    "ه",
    "ن",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الراجل المشنوق'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  figureImage(Game.tries >= 0, 'assets/hang.png'),
                  figureImage(Game.tries >= 1, 'assets/head.png'),
                  figureImage(Game.tries >= 2, 'assets/body.png'),
                  figureImage(Game.tries >= 3, 'assets/ra.png'),
                  figureImage(Game.tries >= 4, 'assets/la.png'),
                  figureImage(Game.tries >= 5, 'assets/rl.png'),
                  figureImage(Game.tries >= 6, 'assets/ll.png'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              width: 200,
              child: TextField(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLength: 11,
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                onSubmitted: (value) => setState(() {
                  word = value;
                }),
                decoration: InputDecoration(
                  counterStyle: const TextStyle(color: Colors.white),
                  hintText: '...اكتب الكلمة هنا',
                    hintStyle: const TextStyle(color: Colors.blue),
                    label: const Center(
                        child: Text(
                      'كلمة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          color: Colors.white),
                    )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: word
                  .split('')
                  .reversed
                  .map(
                    (e) => letter(
                      e,
                      !Game.selectedChar.contains(
                        e,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              width: double.infinity,
              height: 330,
              child: GridView.count(
                crossAxisCount: 6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: const EdgeInsets.all(8),
                children: arAlphabets.map((e) {
                  return RawMaterialButton(
                    onPressed: Game.selectedChar.contains(e)
                        ? null
                        : () {
                            setState(() {
                              Game.selectedChar.add(e);
                              if (!word.split('').contains(e)) {
                                Game.tries++;
                              }
                            });
                          },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    fillColor: Game.selectedChar.contains(e)
                        ? Colors.black87
                        : Colors.blue,
                    child: Text(
                      e,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
