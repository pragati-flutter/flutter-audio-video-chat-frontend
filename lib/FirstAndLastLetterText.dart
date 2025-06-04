import 'dart:math';
import 'package:flutter/material.dart';

class FirstAndLastLetterText extends StatelessWidget {
  final String? input;
  final String? showInput;
  final double? fontSize; // Add fontSize as a parameter

  const FirstAndLastLetterText({super.key, this.input, this.showInput, this.fontSize});

  // Method to generate a random color
  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    ).withOpacity(0.3);
  }

  // Method to get the first letters of the first and last words
  String getFirstLetters(String input) {
    List<String> words = input.split(RegExp(r'\s+'));

    if (words.isEmpty) {
      return '';
    }

    String firstLetter = words.first[0];
    String lastLetter = words.last[0];

    return firstLetter + lastLetter;
  }

  @override
  Widget build(BuildContext context) {
    String letters = showInput != null ? showInput! : getFirstLetters(input ?? "");

    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown, // This scales the text inside the container
        child: Text(
          letters,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: fontSize ?? 25, // Use the provided fontSize or default to 25
          ),
        ),
      ),
    );
  }
}
