import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_session.dart'; // Import the UserSession class

class Api {
  static const String _baseUrl = 'http://localhost:3000'; // Your API base URL

  // Login API call
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final url = Uri.parse('$_baseUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      // Save user data globally
      UserSession().setUserData(responseData['user']);

      // Fetch transactions for the logged-in user
      final userId = responseData['user']['id'];
      final transactionsResponse = await fetchTransactions(userId);

      if (transactionsResponse['success']) {
        UserSession().setTransactions(transactionsResponse['data']);
      }

      return {
        'success': true,
        'message': responseData['message'],
        'user': responseData['user'],
        'transactions': transactionsResponse['data']
      };
    } else if (response.statusCode == 401) {
      return {'success': false, 'message': 'Invalid credentials'};
    } else {
      return {'success': false, 'message': 'Error: ${response.statusCode}'};
    }
  }

  // Fetch transactions by userId
  static Future<Map<String, dynamic>> fetchTransactions(int userId) async {
    final url = Uri.parse('$_baseUrl/transactions/$userId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return {'success': true, 'data': jsonDecode(response.body)};
      } else if (response.statusCode == 404) {
        return {
          'success': false,
          'message': 'No transactions found for this user'
        };
      } else {
        return {'success': false, 'message': 'Error: ${response.statusCode}'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  // Update transaction's isdone field by transaction ID
  static Future<Map<String, dynamic>> updateTransaction(
      int transactionId) async {
    final url = Uri.parse('$_baseUrl/transactions/$transactionId');

    try {
      final response = await http.put(url);

      if (response.statusCode == 200) {
        // Fetch the updated transactions after a successful update
        final userId = UserSession().userData?['id'];

        if (userId != null) {
          final transactionsResponse = await fetchTransactions(userId);

          if (transactionsResponse['success']) {
            // Update transactions in UserSession
            UserSession().setTransactions(transactionsResponse['data']);
          }
        }

        return {'success': true, 'message': 'Transaction updated successfully'};
      } else if (response.statusCode == 404) {
        return {
          'success': false,
          'message': 'Transaction not found or already updated'
        };
      } else {
        return {'success': false, 'message': 'Error: ${response.statusCode}'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  static Future<Map<String, dynamic>> createTransaction({
    required String name,
    required String amount,
    required String date,
    required String imgUrl,
  }) async {
    final url = Uri.parse('$_baseUrl/transactions');

    try {
      final userId = UserSession().userData?['id'];
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userId': userId,
          'name': name,
          'amount': amount,
          'date': date,
          'isdone': 0,
          'imgUrl': imgUrl,
        }),
      );

      print("tryin to new transact");
      if (response.statusCode == 201) {
        final userId = UserSession().userData?['id'];

        if (userId != null) {
          final transactionsResponse = await fetchTransactions(userId);

          if (transactionsResponse['success']) {
            // Update transactions in UserSession
            UserSession().setTransactions(transactionsResponse['data']);
          }
        }

        return {'success': true, 'message': 'Transaction updated successfully'};
      } else {
        return {'success': false, 'message': 'Error: ${response.statusCode}'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }
}
