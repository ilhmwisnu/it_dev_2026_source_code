import 'package:flutter/material.dart';
import 'user_detail_screen.dart';
import 'user_form_screen.dart';
import 'profile_screen.dart';

final _allUsers = List.generate(
  12,
  (i) => {
    'id': i + 1,
    'name': [
      'John Doe',
      'Jane Smith',
      'Alice Walker',
      'Bob Martin',
      'Carol White',
      'David Lee',
      'Eva Green',
      'Frank Brown',
      'Grace Kim',
      'Henry Wilson',
      'Isla Scott',
      'Jack Taylor',
    ][i],
    'email': [
      'john.doe@example.com',
      'jane.smith@example.com',
      'alice.walker@example.com',
      'bob.martin@example.com',
      'carol.white@example.com',
      'david.lee@example.com',
      'eva.green@example.com',
      'frank.brown@example.com',
      'grace.kim@example.com',
      'henry.wilson@example.com',
      'isla.scott@example.com',
      'jack.taylor@example.com',
    ][i],
    'avatar': 'https://picsum.photos/id/${i + 1}/200/200',
  },
);

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _allUsers.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (_, i) {
          final user = _allUsers[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['avatar'] as String),
            ),
            title: Text(user['name'] as String),
            subtitle: Text(user['email'] as String),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UserDetailScreen(user: user)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const UserFormScreen()),
        ),
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
    );
  }
}
