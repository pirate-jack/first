import 'package:first/ListView/practical/model/product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> ProductList = [
      Product(
          name: 'Dell G15 5520 Gaming Laptop',
          price: 71500,
          dec:
              'Processor : 12th Gen Intel Core i5-12500H | Up to 4.50 Ghz | 12 cores | 16 Threads | 18 MB Cache | 45 W TDP // Memory : 16 GB, 2 x 8 GB, DDR5, 4800 MHz // Storage :  512 GB SSD',
          image: 'assets/product/dell.jpg',
          add: true),
      Product(
          name: 'Acer Aspire 5 Gaming Intel Core i5 12th gen (12-Cores)',
          image: 'assets/product/acer.jpg',
          price: 51750,
          dec:
              'Acer Aspire 5 Gaming laptop is powered by the latest 12th Gen Intel Core i7 processor consisting of 12 cores for multitasking and productivity.;RTX Its On : NVIDIA GeForce RTX 2050 ',
          add: false),
      Product(
        name:
            'MSI Gaming GF63 Thin, Intel Core i7-11800H, 40CM FHD 144Hz Gaming Laptop ',
        image: 'assets/product/msi.jpg',
        price: 52900,
        dec:
            'Operating System: Pre-loaded Windows 10 Home with lifetime validity (Free Upgrade to Windows 11 Home when Available)',
      ),
      Product(
          name:
              'ASUS Rog Strix G15, AMD Ryzen 7 6800H, (Include - Rog Impact Mouse & Mat), 15.6"(39.62 Cm) Fhd 144Hz, 4Gb',
          image: 'assets/product/rog.jpg',
          price: 83900,
          dec:
              'Processor: AMD Ryzen 7 6800HS Mobile Processor (8-core/16-thread, 20MB cache, up to 4.7 GHz max boost)',
          add: true),
      Product(
          name: 'Dell G15 5520 Gaming Laptop',
          price: 71500,
          dec:
          'Processor : 12th Gen Intel Core i5-12500H | Up to 4.50 Ghz | 12 cores | 16 Threads | 18 MB Cache | 45 W TDP // Memory : 16 GB, 2 x 8 GB, DDR5, 4800 MHz // Storage :  512 GB SSD',
          image: 'assets/product/dell.jpg',
          add: true),
      Product(
          name: 'Acer Aspire 5 Gaming Intel Core i5 12th gen (12-Cores)',
          image: 'assets/product/acer.jpg',
          price: 51750,
          dec:
          'Acer Aspire 5 Gaming laptop is powered by the latest 12th Gen Intel Core i7 processor consisting of 12 cores for multitasking and productivity.;RTX Its On : NVIDIA GeForce RTX 2050 ',
          add: false),
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Gaming Laptops',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: ProductList.length,
          itemBuilder: (context, index) {
            Product product = ProductList[index];

            return Card(
              elevation: 10,
              child: ListTile(
                  leading: Container(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                      )),
                  title: Text(product.name),
                  subtitle: Text(product.dec),
                trailing: IconButton(onPressed:() {
                  ProductList[index].add=!ProductList[index].add;
                },icon: ProductList[index].add==true?Icon(Icons.check):Icon(Icons.add),),
              ),
            );
          },
        ));
  }
}
