import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  bool isLoading;
  final Color color;
  final String? imagePath;
  double? width;
  double? height;

  Button({
    super.key,
    required this.title,
    required this.onTap,
    required this.isLoading,
    required this.color,
    this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 55,
        width: width ?? 330,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.center, // Centers the text within the container
          children: [
            Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
            ),
            Positioned(
              right: 20, // Adjust as needed for spacing
              child: imagePath != null
                  ? Image.asset(
                      imagePath!,
                      scale: 4,
                    )
                  : const SizedBox(), // Placeholder if no image
            ),
          ],
        ),
      ),
    );
  }
}
