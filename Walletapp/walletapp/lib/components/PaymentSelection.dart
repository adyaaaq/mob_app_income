import 'package:flutter/material.dart';

class PaymentSelection extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentSelection({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal.withOpacity(0.1) : Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Icon with background circle
            CircleAvatar(
              radius: 24,
              backgroundColor:
                  isSelected ? Colors.teal.withOpacity(0.1) : Colors.grey[200],
              child: Icon(
                icon,
                color: isSelected ? Colors.teal : Colors.grey,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),

            // Label
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.teal : Colors.grey,
              ),
            ),

            const Spacer(),

            // Selection indicator (Radio icon)
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? Colors.teal : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
