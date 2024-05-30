import 'package:flutter/material.dart';
import 'package:flutter_embed_unity/flutter_embed_unity.dart';

class ARViewPage extends StatefulWidget {
  ARViewPage({super.key});

  @override
  State<ARViewPage> createState() => _ARViewPageState();
}

class _ARViewPageState extends State<ARViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmbedUnity(
        onMessageFromUnity: (String message) {
          // Receive message from Unity sent via SendToFlutter.cs
        },
      ),
    );
  }
}
