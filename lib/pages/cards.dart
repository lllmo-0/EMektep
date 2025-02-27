import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);
  static const String route = '/cards';

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Color primaryColor = const Color(0xFF192B50);

  // Cards tab variables
  String selectedCardType = 'Red';
  String selectedCardRecipient = 'Student';
  DateTime selectedCardDate = DateTime.now();

  // Permissions tab variables
  String selectedPermissionType = 'Phone';
  String selectedPermissionRecipient = 'Student';
  DateTime selectedPermissionDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Format date for display
  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // Show date picker
  Future<void> _selectDate(BuildContext context, bool isCardTab) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isCardTab ? selectedCardDate : selectedPermissionDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isCardTab) {
          selectedCardDate = picked;
        } else {
          selectedPermissionDate = picked;
        }
      });
    }
  }

  // Cards tab content
  Widget _buildCardsTab() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Type Selection
          Text(
            'Card Type',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedCardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: ['Red', 'Green'].map((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCardType = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          // Recipient Selection
          Text(
            'Recipient',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedCardRecipient,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: ['Student', 'Students'].map((String recipient) {
              return DropdownMenuItem<String>(
                value: recipient,
                child: Text(recipient),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCardRecipient = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          // Date Selection
          Text(
            'Date',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _selectDate(context, true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDate(selectedCardDate)),
                  const Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Add Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added $selectedCardType card for $selectedCardRecipient on ${_formatDate(selectedCardDate)}',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(120, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Add', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  // Permissions tab content
  Widget _buildPermissionsTab() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Permission Type Selection
          Text(
            'Permission Type',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedPermissionType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: [
              'Phone',
              'Laptop',
              'Exemption from classes',
              'Exiting school'
            ].map((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedPermissionType = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          // Recipient Selection
          Text(
            'Recipient',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedPermissionRecipient,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: ['Student', 'Students'].map((String recipient) {
              return DropdownMenuItem<String>(
                value: recipient,
                child: Text(recipient),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedPermissionRecipient = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          // Date Selection
          Text(
            'Date',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _selectDate(context, false),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDate(selectedPermissionDate)),
                  const Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Add Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added $selectedPermissionType permission for $selectedPermissionRecipient on ${_formatDate(selectedPermissionDate)}',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(120, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Add', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Cards & Permissions'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Cards'),
            Tab(text: 'Permissions'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(child: _buildCardsTab()),
          SingleChildScrollView(child: _buildPermissionsTab()),
        ],
      ),
    );
  }
}
