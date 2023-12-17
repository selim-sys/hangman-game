import 'package:flutter/material.dart';
import 'package:hangman/constants/colors.dart';

Widget letter(String char, bool hidden){
  return Container(
    height: 55,
    width: 35,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.primaryColorDark,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          char,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19
          ),
        ),
      ),
    ),
  );
}