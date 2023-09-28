import 'package:flutter/material.dart';

class DoubleCircularProgressIndicator extends StatefulWidget {
  @override
  _DoubleCircularProgressIndicatorState createState() =>
      _DoubleCircularProgressIndicatorState();
}

class _DoubleCircularProgressIndicatorState
    extends State<DoubleCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust the duration as needed
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                // Outer progress indicator
                strokeWidth: 8.0,
                value: _controller.value, // Adjust the value as needed (0.0 to 1.0)
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: CircularProgressIndicator(
                  // Inner progress indicator
                  strokeWidth: 8.0,
                  value: _controller.value, // Adjust the value as needed (0.0 to 1.0)
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
