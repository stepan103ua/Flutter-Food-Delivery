import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String categoryName;
  final String imageUrl;
  const CategoryItemWidget({
    super.key,
    required this.onTap,
    required this.categoryName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.green,
              width: 3,
            ),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/burger.png'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'Burgers',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      );
}
