import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemini/data/models/message_model.dart';

Widget itemOfUserMessage(MessageModel message) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(38, 39, 42, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
            topRight: Radius.circular(4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.message!,
              style: const TextStyle(
                color: Color.fromRGBO(173, 173, 176, 1),
                fontSize: 16,
              ),
            ),
            (message.base64 != null && message.base64!.isNotEmpty)
                ? Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(base64Decode(message.base64!)),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    ],
  );
}
