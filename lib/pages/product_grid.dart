import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/custom_card.dart';

class ProductGridPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Laptop Gaming', 
      'price': '\$999', 
      'image': 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400&h=300&fit=crop',
      'rating': 4.5
    },
    {
      'name': 'Smartphone', 
      'price': '\$599', 
      'image': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=300&fit=crop',
      'rating': 4.2
    },
    {
      'name': 'Headphones', 
      'price': '\$199', 
      'image': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop',
      'rating': 4.7
    },
    {
      'name': 'Smartwatch', 
      'price': '\$299', 
      'image': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop',
      'rating': 4.0
    },
    {
      'name': 'Tablet', 
      'price': '\$499', 
      'image': 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=300&fit=crop',
      'rating': 4.3
    },
    {
      'name': 'Camera', 
      'price': '\$799', 
      'image': 'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400&h=300&fit=crop',
      'rating': 4.8
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        final childAspectRatio = constraints.maxWidth > 600 ? 0.8 : 0.7;

        return Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CustomCard(
                elevation: 4,
                borderRadius: 12,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar produk dengan cached_network_image
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: products[index]['image'],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey[200],
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.blue[50],
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_not_supported,
                                        size: 40,
                                        color: Colors.grey[400],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Gagal memuat\n gambar',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      
                      // Nama produk
                      Text(
                        products[index]['name'],
                        style: TextStyle(
                          fontSize: constraints.maxWidth > 600 ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      
                      // Rating
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, 
                              size: constraints.maxWidth > 600 ? 18 : 16),
                          SizedBox(width: 4),
                          Text(
                            products[index]['rating'].toString(),
                            style: TextStyle(
                              fontSize: constraints.maxWidth > 600 ? 16 : 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Spacer(),
                          Text(
                            products[index]['price'],
                            style: TextStyle(
                              fontSize: constraints.maxWidth > 600 ? 18 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${products[index]['name']} ditambahkan ke keranjang'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}