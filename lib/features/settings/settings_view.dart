import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  final List<String> urls;
  final void Function(List<String>) onSave;

  const SettingsView({required this.urls, required this.onSave, super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late List<TextEditingController> _controllers;
  final _formKey = GlobalKey<FormState>();
  String? _error;

  @override
  void initState() {
    super.initState();
    _controllers = widget.urls
        .map((url) => TextEditingController(text: url))
        .toList();
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  bool _validateUrls() {
    for (var c in _controllers) {
      final url = c.text.trim();
      if (url.isEmpty) {
        setState(() => _error = 'URL fields cannot be empty.');
        return false;
      }
      final uri = Uri.tryParse(url);
      if (uri == null || !uri.hasAbsolutePath) {
        setState(() => _error = 'Invalid URL format: $url');
        return false;
      }
    }
    setState(() => _error = null);
    return true;
  }

  void _onSave() {
    if (_validateUrls()) {
      widget.onSave(_controllers.map((c) => c.text.trim()).toList());
      Navigator.of(context).pop();
    }
  }

  void _onCancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(icon: const Icon(Icons.close), onPressed: _onCancel),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              for (int i = 0; i < _controllers.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: _controllers[i],
                    decoration: InputDecoration(labelText: 'Tab ${i + 1} URL'),
                  ),
                ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: _onCancel, child: const Text('Cancel')),
                  const SizedBox(width: 16),
                  ElevatedButton(onPressed: _onSave, child: const Text('Save')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
