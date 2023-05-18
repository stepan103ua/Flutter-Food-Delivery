import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/theme/theme.dart';

class HistoryOrderItem extends StatefulWidget {
  final String title;
  final String date;
  final String imageUrl;
  final String username;
  final String surname;
  final String phoneNumber;
  final int quantity;
  final int price;

  HistoryOrderItem({
    super.key,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.username,
    required this.surname,
    required this.quantity,
    required this.price,
    required this.phoneNumber,
  });

  @override
  State<HistoryOrderItem> createState() => _HistoryOrderItemState();
}

class _HistoryOrderItemState extends State<HistoryOrderItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            _isExpanded = !isExpanded;
            setState(() {});
          },
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) => ListTile(
                title: Text(widget.title),
                subtitle: Text(widget.date),
              ),
              body: Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.imageUrl,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : const CircularProgressIndicator(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Username: ',
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                          Text(
                            widget.username,
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Surname: ',
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                          Text(
                            widget.surname,
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone number: ',
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                          Text(
                            widget.phoneNumber.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity: ',
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                          Text(
                            widget.quantity.toString(),
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: ',
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                          Text(
                            '${widget.price}₴',
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Summary:',
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                          Text(
                            '${widget.quantity * widget.price}₴',
                            style: Theme.of(context).textTheme.orderDescription,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isExpanded: _isExpanded,
            ),
          ],
        ),
      );
}
