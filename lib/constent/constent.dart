import 'package:flutter/material.dart';

const CboldTxt = TextStyle(
  fontSize: 36,
  color: Colors.black,
);

const CNormalTxt = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w300,
  color: Color(0XFF8B959A),
);

const CDecorationforPassInput = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE2E6EA), width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE2E6EA), width: 1.0),
  ),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    //borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  hintText: 'Password',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
  ),
);

const CDecorationforMailInput = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE2E6EA), width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE2E6EA), width: 1.0),
  ),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    //borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  hintText: 'Email',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
  ),
);
