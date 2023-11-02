import 'package:flutter/material.dart';


class CustomButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData icons;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.icons,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color? _buttonColor;
  late Color _textColor;

  @override
  void initState() {
    _textColor = widget.textColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _textColor = Colors.white60;
        });
      },
      onTapUp: (_) {
        setState(() {
          _textColor = widget.textColor;
        });
      },
      onTapCancel: () {
        setState(() {
          _textColor = widget.textColor;
        });
      },
      onTap: widget.onPressed,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>[
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              // padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 13.0),
              padding: const EdgeInsets.fromLTRB(15, 20, 220, 5),
              child: Text(

                widget.buttonText,
                style: TextStyle(
                  color: _textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              widget.icons,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ]
      ),
    );
  }
}


/*
body:  ListView(
      //   children:  [
      //     CustomButton(
      //       buttonText: 'Random',
      //       icons: Icons.shuffle,
      //       onPressed: () {
      //         // Do something when the button is pressed
      //       },
      //       textColor: Colors.white,
      //     ),
      //     CustomButton(
      //       buttonText: 'Fashion',
      //       icons: Icons.shopping_bag_rounded,
      //       onPressed: () {
      //         // Do something when the button is pressed
      //       },
      //       textColor: Colors.white,
      //     ),
      //     CustomButton(
      //       buttonText: 'Life',
      //       icons: Icons.facebook,
      //       onPressed: () {
      //         // Do something when the button is pressed
      //       },
      //       textColor: Colors.white,
      //
      //     ),
      //     CustomButton(
      //       buttonText: 'Love',
      //       icons: Icons.heart_broken_sharp,
      //       textColor: Colors.white,
      //       onPressed: () {
      //         // Do something when the button is pressed
      //       },
      //     ),
      //     CustomButton(
      //       buttonText: 'Sport',
      //       icons: Icons.sports,
      //       onPressed: () {
      //         // Do something when the button is pressed
      //       },
      //       textColor: Colors.white,
      //     ),
      //     Divider(
      //       height: 20.0,
      //       color: Colors.blue[200],
      //       thickness: 10,
      //     ),
      //   ],
      // ),
* */
// wait()async{
//   Future.delayed(const Duration(seconds: 3), (){
//     Navigator.pushNamed(context, "/home");
//   });
// }

