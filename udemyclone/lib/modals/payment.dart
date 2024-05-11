import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic>? paymentIntent;

Future<void> payment(double total) async {
  print(total * 1000);
  try {
    var response = await http.post(
      Uri.parse("https://api.stripe.com/v1/payment_intents"),
      headers: {
        'Authorization':
            'Bearer sk_test_51PDjCFSIlvxZxK971CYBtKadWlbovbww6EK8kb6lCQsLQvizZd0kN6BwSZPJjVgHEQ0KL6emEX9NmEDaoy84wJON00VkYn5qSh',
        'Content-type': 'application/x-www-form-urlencoded',
      },
      body: {"amount": "${total.toInt() * 100}", "currency": "INR"},
    );
    paymentIntent = json.decode(response.body);
  } catch (error) {
    print(error);

    throw Exception(error);
  }

  try {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!['client_secret'],
        merchantDisplayName: "Udemy",
      ),
    );

    await Stripe.instance
        .presentPaymentSheet()
        .then((value) => print("Payment successful"));
  } catch (error) {
    print(error);
    throw Exception(error);
  }
}
