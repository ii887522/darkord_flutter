import 'package:flutter/material.dart';

// Global Keys
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

// API endpoints
const httpApiBaseUrl = String.fromEnvironment('darkordHttpApiBaseUrl');
const wsApiBaseUrl = String.fromEnvironment('darkordWsApiBaseUrl');
