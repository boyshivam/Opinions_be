import "package:flutter/material.dart";

class GenericNavButton extends StatelessWidget {
  const GenericNavButton({super.key, required this.ctaText});

  final String ctaText;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withValues(alpha: 0.5),
      ),
      child: Text(
        ctaText,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
