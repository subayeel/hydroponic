import 'package:flutter/material.dart';

const primaryColor = Color(0xff343434);
const secondaryColor = Color(0xFFffffff);
const double defaultPadding = 12;

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
);

const kPrimaryTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);
const kSmallTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Colors.white70,
);
