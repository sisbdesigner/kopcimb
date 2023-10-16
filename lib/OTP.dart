import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 4; i++)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: Colors.black)

            ),
            width: 50,
            child: TextField(
              controller: controllers[i],
              focusNode: focusNodes[i],
              maxLength: 1,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                if (value.isNotEmpty && i < 3) {
                  FocusScope.of(context).requestFocus(focusNodes[i + 1]);
                } else if (value.isEmpty && i > 0) {
                  FocusScope.of(context).requestFocus(focusNodes[i - 1]);
                }
              },
              decoration: InputDecoration(
                counterText: "",
                focusedBorder: InputBorder.none, // Remove the focused border
                enabledBorder: InputBorder.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
