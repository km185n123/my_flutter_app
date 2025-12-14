import 'package:flutter/material.dart';

class PreferenceActions extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onDelete;
  final String deleteLabel;

  const PreferenceActions({
    super.key,
    required this.onBack,
    required this.onDelete,
    required this.deleteLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _IconButton(icon: Icons.arrow_back, onTap: onBack),
          _IconButton(
            icon: Icons.delete_outline,
            onTap: onDelete,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const _IconButton({required this.icon, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(icon, color: color ?? Colors.black),
        onPressed: onTap,
      ),
    );
  }
}
