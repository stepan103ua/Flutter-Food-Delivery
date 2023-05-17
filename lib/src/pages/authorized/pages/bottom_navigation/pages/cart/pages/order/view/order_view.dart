import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/order/order_cubit/order_cubit.dart';
import 'package:food_delivery/src/values/app_colors.dart';
import 'package:food_delivery/src/widgets/app_text_field.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Ordering'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state is OrderInitialLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.green),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    AppTextField(
                      hint: 'City',
                      onChanged: context.read<OrderCubit>().onCityChanged,
                      isValid: state.city.isValid,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      hint: 'Street',
                      onChanged: context.read<OrderCubit>().onStreetChanged,
                      isValid: state.street.isValid,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      hint: 'Building number',
                      onChanged:
                          context.read<OrderCubit>().onBuildingNumberChanged,
                      isValid: state.buildingNumber.isValid,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      hint: 'Phone number',
                      onChanged:
                          context.read<OrderCubit>().onPhoneNumberChanged,
                      isValid: state.phoneNumber.isValid,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Products',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 20),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(10),
                              ),
                              child: Image.network(
                                state.products[index].imageUrl,
                                height: 50,
                                width: 90,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.products[index].productName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Quantity: ',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            '${state.products[index].quantity}x',
                                        style: const TextStyle(
                                          color: AppColors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              '${state.products[index].totalPrice} ₴',
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: state.products.length,
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: AppColors.green,
                      thickness: 2,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL PRICE',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          '${state.totalPriceString} ₴',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: state.isCreatingOrder
                          ? null
                          : context.read<OrderCubit>().onOrder,
                      child: const Text('Order'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
