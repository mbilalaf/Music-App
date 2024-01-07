import 'package:flutter/material.dart';
import 'package:my_beats/consts/colors.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.music_note,
                    color: bgColor,
                    size: 102,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 52,
                      ),
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
