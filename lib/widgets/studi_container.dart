import 'package:flutter/material.dart';

class StudiContainer extends StatefulWidget {
  const StudiContainer({super.key, required this.name, required this.uni});

  final String name;
  final String uni;

  @override
  State<StudiContainer> createState() => _StudiContainerState();
}

class _StudiContainerState extends State<StudiContainer> {
  Color backgroundColor = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          backgroundColor = Colors.pinkAccent;
        });
        debugPrint('User hat Container geklickt');
      },

      child: Container(
        height: 200,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: backgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name, style: TextStyle(fontSize: 30, color: Colors.white)),
              SizedBox(width: 100, child: Divider()),
              Text(widget.uni, style: TextStyle(fontSize: 24, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
