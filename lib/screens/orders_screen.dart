import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Name clash Cart Item from widget and providers, to overcome
// Either use show to select specific class you want
// Or use as to give alias name
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
// import '../widgets/order_item.dart' as oi;

import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
