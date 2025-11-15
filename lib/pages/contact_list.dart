import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/status_indicator.dart';

class ContactListPage extends StatelessWidget {
  final List<Map<String, dynamic>> contacts = [
    {
      'name': 'Budi Santoso',
      'phone': '08123456789',
      'status': 'Online',
      'lastSeen': 'Sekarang'
    },
    {
      'name': 'Sari Dewi',
      'phone': '08129876543',
      'status': 'Offline',
      'lastSeen': '2 jam lalu'
    },
    {
      'name': 'Rina Wijaya',
      'phone': '08111222333',
      'status': 'Away',
      'lastSeen': '30 menit lalu'
    },
    {
      'name': 'David Setiawan',
      'phone': '08133445566',
      'status': 'Online',
      'lastSeen': 'Sekarang'
    },
    {
      'name': 'Maya Indah',
      'phone': '08155667788',
      'status': 'Offline',
      'lastSeen': '5 jam lalu'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari kontak...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[50],
            ),
          ),
        ),
        
        // Contact List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return CustomCard(
                margin: EdgeInsets.only(bottom: 12),
                borderRadius: 12,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: _getAvatarColor(index),
                    child: Text(
                      contacts[index]['name'][0],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    contacts[index]['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contacts[index]['phone']),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          StatusIndicator(status: contacts[index]['status']),
                          SizedBox(width: 6),
                          Text(
                            contacts[index]['lastSeen'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.message, color: Colors.blue),
                        onPressed: () {
                          _showMessageDialog(context, contacts[index]['name']);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.call, color: Colors.green),
                        onPressed: () {
                          _showCallDialog(context, contacts[index]['name']);
                        },
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _showContactDetail(context, contacts[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getAvatarColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
    ];
    return colors[index % colors.length];
  }

  void _showCallDialog(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Memanggil...'),
        content: Text('Memanggil $name'),
        icon: Icon(Icons.call, color: Colors.green, size: 40),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batalkan'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Memanggil $name...'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Panggil'),
          ),
        ],
      ),
    );
  }

  void _showMessageDialog(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Kirim Pesan'),
        content: TextField(
          decoration: InputDecoration(
            hintText: 'Ketik pesan untuk $name...',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Pesan terkirim ke $name'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text('Kirim'),
          ),
        ],
      ),
    );
  }

  void _showContactDetail(BuildContext context, Map<String, dynamic> contact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detail Kontak'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: _getAvatarColor(contacts.indexOf(contact)),
                child: Text(
                  contact['name'][0],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Nama: ${contact['name']}'),
            Text('Telepon: ${contact['phone']}'),
            Text('Status: ${contact['status']}'),
            Text('Terakhir dilihat: ${contact['lastSeen']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tutup'),
          ),
        ],
      ),
    );
  }
}