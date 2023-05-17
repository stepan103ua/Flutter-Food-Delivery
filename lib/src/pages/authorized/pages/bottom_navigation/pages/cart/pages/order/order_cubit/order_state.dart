part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  final List<CartItem> products;
  final ValidationModel city;
  final ValidationModel street;
  final ValidationModel buildingNumber;
  final ValidationModel phoneNumber;
  final bool isCreatingOrder;

  const OrderState({
    required this.products,
    required this.city,
    required this.street,
    required this.buildingNumber,
    required this.phoneNumber,
    required this.isCreatingOrder,
  });

  String get totalPriceString => products
      .fold(
        0.0,
        (previousValue, element) => previousValue + element.totalPrice,
      )
      .toStringAsFixed(2);

  bool get isValid =>
      city.isValid != null &&
      street.isValid != null &&
      buildingNumber.isValid != null &&
      phoneNumber.isValid != null &&
      city.isValid! &&
      street.isValid! &&
      buildingNumber.isValid! &&
      phoneNumber.isValid!;

  OrderState validate() => OrderUpdated(
    products: products,
    city: AppValidation.fieldValidation(city.value),
    street: AppValidation.fieldValidation(street.value),
    buildingNumber: AppValidation.fieldValidation(buildingNumber.value),
    phoneNumber: AppValidation.phoneNumberValidation(phoneNumber.value),
    isCreatingOrder: isCreatingOrder,
  );

  OrderState updatedCreatingOrder(bool isCreatingOrder) => OrderUpdated(
        products: products,
        city: city,
        street: street,
        buildingNumber: buildingNumber,
        phoneNumber: phoneNumber,
        isCreatingOrder: isCreatingOrder,
      );

  OrderState updatedProducts(List<CartItem> products) => OrderUpdated(
        products: products,
        city: city,
        street: street,
        buildingNumber: buildingNumber,
        phoneNumber: phoneNumber,
        isCreatingOrder: isCreatingOrder,
      );

  OrderState updatedCity(String? city) => OrderUpdated(
        products: products,
        city: AppValidation.fieldValidation(city),
        street: street,
        buildingNumber: buildingNumber,
        phoneNumber: phoneNumber,
        isCreatingOrder: isCreatingOrder,
      );

  OrderState updatedStreet(String? street) => OrderUpdated(
        products: products,
        city: city,
        street: AppValidation.fieldValidation(street),
        buildingNumber: buildingNumber,
        phoneNumber: phoneNumber,
        isCreatingOrder: isCreatingOrder,
      );

  OrderState updatedBuildingNumber(String? buildingNumber) => OrderUpdated(
        products: products,
        city: city,
        street: street,
        buildingNumber: AppValidation.fieldValidation(buildingNumber),
        phoneNumber: phoneNumber,
        isCreatingOrder: isCreatingOrder,
      );

  OrderState updatedPhoneNumber(String? phoneNumber) => OrderUpdated(
        products: products,
        city: city,
        street: street,
        buildingNumber: buildingNumber,
        phoneNumber: AppValidation.phoneNumberValidation(phoneNumber),
        isCreatingOrder: isCreatingOrder,
      );

  @override
  List<Object?> get props => [
        products,
        city,
        buildingNumber,
        phoneNumber,
        street,
        isCreatingOrder,
      ];
}

class OrderInitialLoading extends OrderState {
  const OrderInitialLoading({
    super.products = const [],
    super.city = const ValidationModel(value: ''),
    super.street = const ValidationModel(value: ''),
    super.buildingNumber = const ValidationModel(value: ''),
    super.phoneNumber = const ValidationModel(value: ''),
    super.isCreatingOrder = false,
  });
}

class OrderUpdated extends OrderState {
  const OrderUpdated({
    required super.products,
    required super.city,
    required super.street,
    required super.buildingNumber,
    required super.phoneNumber,
    required super.isCreatingOrder,
  });
}
