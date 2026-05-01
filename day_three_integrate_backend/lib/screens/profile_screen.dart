import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _profile = {
    'id': 1,
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'avatar': 'https://picsum.photos/id/1/200/200',
  };

  void _onLogout(BuildContext context) {
    // TODO: clear token
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = _profile['name'] as String;
    final email = _profile['email'] as String;
    final avatar = _profile['avatar'] as String;
    final id = _profile['id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _onLogout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(avatar),
            ),
            const SizedBox(height: 16),
            Text(name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 4),
            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _ProfileRow(icon: Icons.tag, label: 'ID', value: '#$id'),
                    const Divider(),
                    _ProfileRow(icon: Icons.person, label: 'Name', value: name),
                    const Divider(),
                    _ProfileRow(icon: Icons.email, label: 'Email', value: email),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.outline),
          const SizedBox(width: 12),
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
