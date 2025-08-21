import 'dart:convert';

import 'package:fitcker/core/extensions/ref_debounce_and_cancel.dart';
import 'package:fitcker/data/models/quote/quote.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quote_provider.g.dart';

@riverpod
Future<Quote> getQuote(Ref ref) async {
  final url = Uri.parse('https://quotes-api-self.vercel.app/quote');
  final client = await ref.getCleanClient();
  final response = await client.get(url);
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return Quote.fromJson(body);
  } else {
    throw Exception('Failed to load quote');
  }
}
