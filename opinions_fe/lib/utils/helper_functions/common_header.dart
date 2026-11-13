import "package:flutter/material.dart";

class CommonHeader extends StatelessWidget {
  const CommonHeader({super.key, required this.headerText});

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 16, 20, 10),
      child: SizedBox(
        height: 48,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              headerText,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: IconButton(
            //     onPressed: () => Navigator.of(context).pop(),
            //     icon: const Icon(Icons.arrow_back),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
