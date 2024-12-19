import 'package:flutter/material.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  // Track the selected account index
  int? _selectedIndex;

  // List of accounts
  final List<AccountOption> _accounts = [
    AccountOption(
      title: 'Bank Link',
      subtitle: 'Connect your bank account to deposit & fund',
      icon: Icons.account_balance,
    ),
    AccountOption(
      title: 'Microdeposits',
      subtitle: 'Connect bank in 5-7 days',
      icon: Icons.monetization_on,
    ),
    AccountOption(
      title: 'Paypal',
      subtitle: 'Connect your Paypal account',
      icon: Icons.paypal,
    ),
  ];

  // Function to handle account selection
  void _selectAccount(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display account options
              ...List.generate(_accounts.length, (index) {
                final account = _accounts[index];
                final isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () => _selectAccount(index),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.teal.withOpacity(0.1)
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                      border: isSelected
                          ? Border.all(color: Colors.teal, width: 1)
                          : Border.all(color: Colors.transparent),
                    ),
                    child: ListTile(
                      leading: Icon(
                        account.icon,
                        color: isSelected ? Colors.teal : Colors.grey,
                      ),
                      title: Text(
                        account.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.teal : Colors.black,
                        ),
                      ),
                      subtitle: Text(account.subtitle),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.teal)
                          : null,
                    ),
                  ),
                );
              }),

              const SizedBox(height: 30),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedIndex != null ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // No background color
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32), // Border radius
                      side: BorderSide(
                        color: _selectedIndex != null
                            ? Colors.teal
                            : Colors.grey, // Border color based on selection
                        width: 1, // Border width
                      ),
                    ),
                    disabledForegroundColor:
                        Colors.grey, // Text color when disabled
                    foregroundColor: Colors.teal, // Text color when enabled
                    elevation: 0, // No shadow
                  ),
                  child: const Text(
                    'ДАРААХ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Data model for account options
class AccountOption {
  final String title;
  final String subtitle;
  final IconData icon;

  AccountOption({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
