import 'package:flutter/material.dart';

class DashBoardHeader extends StatelessWidget {
  const DashBoardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Goood Morning, Rishu',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                radius: 22.3,
                backgroundColor: Colors.deepOrange,
                child: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://raw.githubusercontent.com/imrishuroy/Rishu-Portfolio/master/assets/avtar.png'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 50.0,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 7.0),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search your required products',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Colors.transparent,
                    style: BorderStyle.none,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Colors.transparent,
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Colors.transparent,
                    style: BorderStyle.none,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Colors.transparent,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
