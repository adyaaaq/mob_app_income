import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // Selected transaction name
  String _selectedTransaction = 'Netflix';
  final List<String> _transactions = ['Netflix', 'Spotify', 'Amazon', 'Hulu'];

  // Amount Controller
  final TextEditingController _amountController =
      TextEditingController(text: '\$ 48.00');

  // Selected date
  DateTime _selectedDate = DateTime.now();

  // Function to pick a date
  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('bg.png'), // Replace with your image path
                fit: BoxFit.cover, // Makes the image cover the entire container
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Түрийвч',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF408D87),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.notifications_none, color: Colors.white),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height *
                  0.20, // 15% of screen height for top padding
              left: 16.0, // 16px for left padding
              right: 16.0, // 16px for right padding
            ),
            padding: EdgeInsets.only(
              left: 16.0, // 16px for left padding
              right: 16.0, // 16px for right padding
              top: 32.0, // 16px for bottom padding
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.4), // Shadow color with opacity
                  offset: const Offset(0, 16), // Horizontal and vertical offset
                  blurRadius: 12, // Blur radius
                  spreadRadius: 2, // Spread radius
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Transaction Name Dropdown
                const Text(
                  'ГҮЙЛГЭЭНИЙ НЭР',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedTransaction,
                      items: _transactions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Image.asset(
                                'netflix.png', // Replace with actual asset path
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTransaction = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Amount Field
                const Text(
                  'ҮНИЙН ДҮН',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Date Picker
                const Text(
                  'ОГНОО',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _pickDate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_selectedDate.toLocal()}'.split(' ')[0],
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Icon(Icons.calendar_today, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Payment Button
                const Text(
                  'ТӨЛБӨР',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // Add payment action here
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          'Төлбөр нэмэх',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
