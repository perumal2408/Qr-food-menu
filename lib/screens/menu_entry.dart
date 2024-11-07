import 'package:flutter/material.dart';
import 'qr_generator.dart';

class MenuEntryScreen extends StatefulWidget {
  @override
  _MenuEntryScreenState createState() => _MenuEntryScreenState();
}

class _MenuEntryScreenState extends State<MenuEntryScreen> {
  final List<Map<String, String>> menuItems = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemDescriptionController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();

  void _addItem() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        menuItems.add({
          "name": itemNameController.text,
          "description": itemDescriptionController.text,
          "price": itemPriceController.text,
        });
      });
      itemNameController.clear();
      itemDescriptionController.clear();
      itemPriceController.clear();
    }
  }

  void _deleteItem(int index) {
    setState(() {
      menuItems.removeAt(index);
    });
  }

  void _editItem(int index) {
    itemNameController.text = menuItems[index]['name']!;
    itemDescriptionController.text = menuItems[index]['description']!;
    itemPriceController.text = menuItems[index]['price']!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: itemNameController,
                  decoration: InputDecoration(labelText: 'Item Name'),
                  validator: (value) => value!.isEmpty ? 'Enter item name' : null,
                ),
                TextFormField(
                  controller: itemDescriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) => value!.isEmpty ? 'Enter item description' : null,
                ),
                TextFormField(
                  controller: itemPriceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter item price' : null,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      menuItems[index] = {
                        "name": itemNameController.text,
                        "description": itemDescriptionController.text,
                        "price": itemPriceController.text,
                      };
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _generateQrCode() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QrGeneratorScreen(menuItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Menu Items')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: itemNameController,
                    decoration: InputDecoration(labelText: 'Item Name'),
                    validator: (value) => value!.isEmpty ? 'Enter item name' : null,
                  ),
                  TextFormField(
                    controller: itemDescriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (value) => value!.isEmpty ? 'Enter item description' : null,
                  ),
                  TextFormField(
                    controller: itemPriceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) => value!.isEmpty ? 'Enter item price' : null,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _addItem,
                    child: Text('Add Item'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item['name']!),
                      subtitle: Text('${item['description']} - \$${item['price']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editItem(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteItem(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _generateQrCode,
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
