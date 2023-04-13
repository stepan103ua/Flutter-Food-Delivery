import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/auth/pages/register/models/city_suggestion.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_cubit.dart';
import 'package:food_delivery/src/values/app_colors.dart';
import 'package:food_delivery/src/values/strings.dart';
import 'package:food_delivery/src/widgets/app_text_field.dart';
import 'package:food_delivery/src/widgets/inverted_elevated_button.dart';

class RegisterCity extends StatelessWidget {
  const RegisterCity({super.key});

  static const _subtitle = 'Select your city';
  static const _searchHint = 'Search your city';

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _subtitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 40),
              AppTextField(
                hint: _searchHint,
                onChanged: context.read<RegisterCubit>().onQueryChanged,
                suffixIcon: const Icon(Icons.search_rounded, size: 35),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.greenBackground,
                      AppColors.white,
                      AppColors.white,
                      AppColors.greenBackground,
                    ],
                    stops: [0.0, 0.05, 0.95, 1.0],
                  ).createShader(bounds),
                  child: ListView.separated(
                    itemBuilder: (context, index) => _SuggestionItem(
                      key: ValueKey(state.foundCitiesSuggestions[index]),
                      city: state.foundCitiesSuggestions[index],
                      isSelected:
                          state.foundCitiesSuggestions[index] == state.city,
                      onSelect: () => context
                          .read<RegisterCubit>()
                          .onSelectCity(state.foundCitiesSuggestions[index]),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: state.foundCitiesSuggestions.length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InvertedElevatedButton(
                      onPressed: context.read<RegisterCubit>().previousPage,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(Strings.back),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: state.canGoToPassword
                          ? context.read<RegisterCubit>().nextPage
                          : null,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(Strings.next),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _SuggestionItem extends StatelessWidget {
  final CitySuggestion city;
  final bool isSelected;
  final VoidCallback onSelect;

  const _SuggestionItem({
    required this.isSelected,
    required this.city,
    required this.onSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onSelect,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? AppColors.green : AppColors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city.name,
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                city.region,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? AppColors.white : null,
                ),
              ),
            ],
          ),
        ),
      );
}
