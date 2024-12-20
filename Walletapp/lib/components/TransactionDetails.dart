import 'package:flutter/material.dart';

class TransactionDetails extends StatefulWidget {
  final String title;
  final String date;
  final String amount;
  final String billtype;

  const TransactionDetails({
    required this.title,
    required this.date,
    required this.amount,
    required this.billtype,
    super.key,
  });

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  // Track if the details are collapsed or expanded
  bool _isCollapsed = false;

  // Function to toggle collapse state
  void _toggleCollapse() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Гүйлгээний дэлгэрэнгүй",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: _toggleCollapse,
              icon: Icon(
                _isCollapsed ? Icons.arrow_downward : Icons.arrow_upward,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Conditionally show or hide the details with scroll support
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _isCollapsed
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: _buildDetails(), // Show details when expanded
          secondChild: const SizedBox.shrink(), // Empty space when collapsed
        ),
      ],
    );
  }

  // Method to build the details content with scrollable support
  Widget _buildDetails() {
    return SizedBox(
      height: 400, // Set a fixed height for the scrollable area
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildDetailRow('Төлбөрийн хэрэгсэл', widget.billtype),
            const SizedBox(height: 6),
            _buildDetailRow('Төлөв', '\$ Хийгдсэн'),
            const SizedBox(height: 6),
            _buildDetailRow('Цаг', '\$ 08:15 AM'),
            const SizedBox(height: 6),
            _buildDetailRow('Огноо', '\$ Feb 28, 2022'),
            const SizedBox(height: 6),
            _buildDetailRow('Гүйлгээний дугаар', '2092913832472..'),
            const SizedBox(height: 10),
            const Divider(color: Color(0xFFDDDDDD)),
            _buildDetailRow('Үнэ', '\$ ${widget.amount}', isTotal: true),
            const SizedBox(height: 10),
            _buildDetailRow('Хураамж', '\$ 0'),
            const SizedBox(height: 10),
            const Divider(color: Color(0xFFDDDDDD)),
            _buildDetailRow('Нийт', '\$ ${widget.amount}', isTotal: true),
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                'qr_code.png', // Ensure this path matches your asset location
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build individual rows
  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
