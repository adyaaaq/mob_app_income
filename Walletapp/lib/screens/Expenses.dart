import 'package:flutter/material.dart';
import 'package:walletapp/service/api.dart'; // Import the API service
import 'package:walletapp/service/user_session.dart'; // Import UserSession for user data

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Map<String, String>> _transactions = [
    {'name': 'Netflix', 'imagePath': 'assets/netflix.png'},
    {'name': 'Spotify', 'imagePath': 'assets/spotify.png'},
    {'name': 'youtube', 'imagePath': 'assets/youtube.png'},
    {'name': 'paypal', 'imagePath': 'assets/paypal.png'},
  ];

  late Map<String, String> _selectedTransaction;

  @override
  void initState() {
    super.initState();
    _selectedTransaction = _transactions[0];
  }

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

  // Function to create a new transaction
  Future<void> _createTransaction() async {
    final amount = _amountController.text.replaceAll('\$', '').trim();

    final response = await Api.createTransaction(
      name: _selectedTransaction['name']!,
      amount: amount,
      date: _selectedDate.toLocal().toString().split(' ')[0],
      imgUrl: _selectedTransaction['imagePath']!,
    );

    if (response['success']) {
      _showSnackBar('Transaction created successfully');
    } else {
      _showSnackBar('Error: ${response['message']}');
    }
  }

  // Function to show a SnackBar for feedback
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background Container
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
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
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Түрийвч',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF408D87),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_none,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Form Container
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.20,
              left: 16.0,
              right: 16.0,
            ),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 16),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Transaction Name Dropdown
                  const Text('ГҮЙЛГЭЭНИЙ НЭР',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Map<String, String>>(
                        value: _selectedTransaction,
                        items: _transactions.map((transaction) {
                          return DropdownMenuItem<Map<String, String>>(
                            value: transaction, // Each value must be unique
                            child: Row(
                              children: [
                                Image.asset(
                                  transaction['imagePath']!,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(transaction['name']!),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedTransaction = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Amount Field
                  const Text('ҮНИЙН ДҮН',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                  const Text('ОГНОО',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                  ElevatedButton(
                    onPressed: _createTransaction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text('Төлбөр нэмэх',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
