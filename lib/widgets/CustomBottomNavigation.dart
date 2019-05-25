import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigation extends StatefulWidget {

  final Function(int) onTap;
  final int initPosition;

  const CustomBottomNavigation({Key key, this.onTap, this.initPosition = 0}) : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {

  int selectedPosition;
  @override
  void initState() {
    selectedPosition = widget.initPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 20.0,
      onTap: (position){
        widget.onTap(position);
        setState(() {
          selectedPosition = position;
        });
      }, // new
      currentIndex: selectedPosition,
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.chrome_reader_mode),
            title: Text('Posts'),
            backgroundColor: Colors.blue
        ),
        BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.youtube),
            title: Text('YouTube'),
            backgroundColor: Colors.blue[800]
        ),
        BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.twitter),
            title: Text('Twitter'),
            backgroundColor: Colors.blue
        )
      ],
    );
  }
}
