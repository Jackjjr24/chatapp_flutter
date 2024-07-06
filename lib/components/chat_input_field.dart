import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatInputField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    Key? key,
    required this.controller,
    required this.onSend,
  }) : super(key: key);

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  bool showEmojiPicker = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showEmojiPicker)
          SizedBox(
            height: 250,
            child: EmojiPicker(
              onEmojiSelected: (Category? category, Emoji emoji) {
                setState(() {
                  widget.controller.text += emoji.emoji;
                });
              },
              config: Config(
                columns: 7,
                emojiSizeMax: 32.0,
                verticalSpacing: 0,
                horizontalSpacing: 0,
                gridPadding: EdgeInsets.zero,
                initCategory: Category.RECENT,
                bgColor: const Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                backspaceColor: Colors.blue,
                recentsLimit: 28,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL,
              ),
            ),
          ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_emotions),
              onPressed: () {
                setState(() {
                  showEmojiPicker = !showEmojiPicker;
                });
              },
            ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: const InputDecoration(
                  hintText: 'Type your message...',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: widget.onSend,
            ),
          ],
        ),
      ],
    );
  }
}
