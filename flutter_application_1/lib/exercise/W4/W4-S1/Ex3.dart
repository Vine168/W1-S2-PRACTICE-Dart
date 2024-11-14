import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Custom buttons")),
      body: CustomButtonExample(),
    ),
  ));
}
enum ButtonType { primary, secondary, disabled }

extension ButtonTypeExtension on ButtonType {
  Color get color {
    switch (this) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }
}
enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;
  const CustomButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: buttonType == ButtonType.disabled ? null : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonType.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPosition == IconPosition.left) Icon(icon),
            SizedBox(width: 8),
            Text(label),
            SizedBox(width: 8),
            if (iconPosition == IconPosition.right) Icon(icon),
          ],
        ),
      ),
    );
  }
}
class CustomButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            label: "Submit",
            icon: Icons.check,
            buttonType: ButtonType.primary,
            iconPosition: IconPosition.left,
          ),
          CustomButton(
            label: "Time",
            icon: Icons.access_time,
            buttonType: ButtonType.secondary,
            iconPosition: IconPosition.right,
          ),
          CustomButton(
            label: "Account",
            icon: Icons.account_circle,
            buttonType: ButtonType.disabled,
            iconPosition: IconPosition.left,
          ),
        ],
      ),
    );
  }
}
