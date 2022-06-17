import 'package:brandie/view/auth/widgets/auth_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: const AuthWidget(
        isLogin: true,
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0022222, size.height * 0.0400000);
    path_0.lineTo(size.width * 0.1055556, size.height * -2);
    path_0.lineTo(size.width * 0.1455556, size.height * -1.5);
    path_0.lineTo(size.width * 0.2800000, size.height * -2);
    path_0.lineTo(size.width * 0.4211111, size.height * 0.0300000);
    path_0.lineTo(size.width * 0.5455556, size.height * 0.0500000);
    path_0.lineTo(size.width * 0.6611111, size.height * 0.0600000);
    path_0.lineTo(size.width * 0.7911111, size.height * 0.0600000);
    path_0.lineTo(size.width * 0.9077778, size.height * 0.0700000);
    path_0.lineTo(size.width * 0.9744444, size.height * 0.0500000);
    path_0.lineTo(size.width * 0.9933333, size.height * 0.0700000);
    path_0.lineTo(size.width * 0.9977778, size.height * 0.9300000);
    path_0.lineTo(size.width * 0.8611111, size.height * 0.9400000);
    path_0.lineTo(size.width * 0.7266667, size.height * 0.9500000);
    path_0.lineTo(size.width * 0.4844444, size.height * 0.9500000);
    path_0.lineTo(size.width * 0.2955556, size.height * 0.9600000);
    path_0.lineTo(size.width * 0.1344444, size.height * 0.9600000);
    path_0.lineTo(size.width * 0.0033333, size.height * 0.9400000);
    path_0.lineTo(size.width * 0.0077778, size.height * 0.5200000);
    path_0.lineTo(size.width * 0.0022222, size.height * 0.0600000);

    // canvas.drawPath(path_0, paint_0);
    canvas.drawDRRect(RRect.fromLTRBAndCorners(10, 10, 10, 10),
        RRect.fromLTRBAndCorners(-10, -50, -10, -10), paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
