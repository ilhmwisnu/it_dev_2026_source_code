import 'package:flutter/material.dart';

class UserFormScreen extends StatefulWidget {
  final Map<String, dynamic>? user;

  const UserFormScreen({super.key, this.user});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _avatarController;

  bool get _isEditMode => widget.user != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user?['name'] ?? '');
    _emailController = TextEditingController(text: widget.user?['email'] ?? '');
    _avatarController = TextEditingController(text: widget.user?['avatar'] ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _avatarController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: call POST /api/users or PUT /api/users/:id
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isEditMode ? 'User updated successfully' : 'User created successfully'),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEditMode ? 'Edit User' : 'Add User')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (v) => (v == null || v.isEmpty) ? 'Name is required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Email is required';
                  if (!v.contains('@')) return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _avatarController,
                decoration: const InputDecoration(
                  labelText: 'Avatar URL (optional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _onSubmit,
                child: Text(_isEditMode ? 'Update User' : 'Create User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
