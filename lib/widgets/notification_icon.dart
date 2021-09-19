import 'package:flutter/material.dart';

class NoticationIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const NoticationIcon({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.notifications_outlined,
            size: 30.0,
          ),
        ),
        const Positioned(
          top: 9.1,
          right: 12.0,
          child: CircleAvatar(
            radius: 5.0,
            backgroundColor: Colors.red,
          ),
        )
      ],
    );
  }
}
