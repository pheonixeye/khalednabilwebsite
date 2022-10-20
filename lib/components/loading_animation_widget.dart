import 'package:flutter/material.dart';

class LoadingAnimationWidget extends StatelessWidget {
  const LoadingAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Loading...'),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
