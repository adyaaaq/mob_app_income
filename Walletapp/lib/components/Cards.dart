import 'package:flutter/material.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({super.key});

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  // Controllers for input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  // Default card values
  String _cardName = 'IRVAN MOSES';
  String _cardNumber = '6219 8610 2888 8075';
  String _expiryDate = '22/01';
  String _cvc = '123';
  String _zip = '12130';

  @override
  void initState() {
    super.initState();

    // Listen to changes in controllers
    _nameController.addListener(
        () => setState(() => _cardName = _nameController.text.toUpperCase()));
    _numberController.addListener(
        () => setState(() => _cardNumber = _numberController.text));
    _expiryController.addListener(
        () => setState(() => _expiryDate = _expiryController.text));
    _cvcController
        .addListener(() => setState(() => _cvc = _cvcController.text));
    _zipController
        .addListener(() => setState(() => _zip = _zipController.text));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack to layer the smaller card behind the big card
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Smaller Card (behind)
                Positioned(
                  top: 20,
                  left: 10,
                  right: 0,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1C9B94), Color(0xFF56DFB6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),

                // Big Card (in front)
                Container(
                  height: 180,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF257C7C), Color(0xFF1EB6B4)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card Type and Bank Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Debit Card',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Mono',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Card Number
                      Text(
                        _cardNumber.isNotEmpty
                            ? _cardNumber
                            : 'XXXX XXXX XXXX XXXX',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Cardholder Name and Expiry Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _cardName.isNotEmpty
                                ? _cardName
                                : 'CARDHOLDER NAME',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _expiryDate.isNotEmpty ? _expiryDate : 'MM/YY',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Card Information Form
            const Text(
              'Картны мэдээлэл нэмэх',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Card Name Field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'КАРТ ДЭЭРХ НЭР',
                labelStyle:
                    const TextStyle(color: Colors.grey), // Default label color
                floatingLabelStyle: const TextStyle(
                    color: Color(0xFF257C7C)), // Focused label color

                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFF257C7C), width: 1),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Card Number and CVC Fields
            Row(
              children: [
                // 75% Width for Card Number
                Flexible(
                  flex: 3, // 3 parts out of 4 (75%)
                  child: TextField(
                    controller: _numberController,
                    decoration: InputDecoration(
                      labelText: 'КАРТНЫ ДУГААР',
                      labelStyle: const TextStyle(
                          color: Colors.grey), // Default label color
                      floatingLabelStyle: const TextStyle(
                          color: Color(0xFF257C7C)), // Focused label color

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Color(0xFF257C7C), width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // 25% Width for CVC
                Flexible(
                  flex: 1, // 1 part out of 4 (25%)
                  child: TextField(
                    controller: _cvcController,
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      labelStyle: const TextStyle(
                          color: Colors.grey), // Default label color
                      floatingLabelStyle: const TextStyle(
                          color: Color(0xFF257C7C)), // Focused label color

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Color(0xFF257C7C), width: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                // 75% Width for Card Number
                Flexible(
                  flex: 3, // 3 parts out of 4 (75%)
                  child: TextField(
                    controller: _expiryController,
                    decoration: InputDecoration(
                      labelText: 'ДУУСАХ ХУГАЦАА YYYY/MM',
                      labelStyle: const TextStyle(
                          color: Colors.grey), // Default label color
                      floatingLabelStyle: const TextStyle(
                          color: Color(0xFF257C7C)), // Focused label color
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Color(0xFF257C7C), width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // 25% Width for CVC
                Flexible(
                  flex: 1, // 1 part out of 4 (25%)
                  child: TextField(
                    controller: _zipController,
                    decoration: InputDecoration(
                      labelText: 'ZIP',

                      labelStyle: const TextStyle(
                          color: Colors.grey), // Default label color
                      floatingLabelStyle: const TextStyle(
                          color: Color(0xFF257C7C)), // Focused label color
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Color(0xFF257C7C), width: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
