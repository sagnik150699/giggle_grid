import 'package:flutter/material.dart';

import 'custom_text_widgets.dart';

AppBar commonAppBar(text) {
  return AppBar(
    toolbarHeight: 60.0,
    centerTitle: true,
    title: OrbitronFont(
      text: text,
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
