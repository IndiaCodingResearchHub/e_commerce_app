import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Shipping Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Shipping Address'),
              ),
              SizedBox(height: 32),
              Text(
                'Payment Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _cardNumberController,
                decoration: InputDecoration(labelText: 'Card Number'),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(labelText: 'Expiry Date'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _cvvController,
                      decoration: InputDecoration(labelText: 'CVV'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Implement checkout logic
                  _performCheckout();
                },
                child: Text('Complete Purchase'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performCheckout() {
    // Implement logic to process the checkout, validate inputs, and handle the payment.
    // You can use the entered data from controllers (_nameController, _addressController, etc.)
    // Display a confirmation message or navigate to the order summary screen.
    // For simplicity, we'll just print the entered data in this example.
    print('Name: ${_nameController.text}');
    print('Address: ${_addressController.text}');
    print('Card Number: ${_cardNumberController.text}');
    print('Expiry Date: ${_expiryDateController.text}');
    print('CVV: ${_cvvController.text}');
  }
}