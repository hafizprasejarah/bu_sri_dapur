import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/editmenu_controller.dart';

class EditmenuView extends GetView<EditmenuController> {
  const EditmenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditmenuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditmenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
