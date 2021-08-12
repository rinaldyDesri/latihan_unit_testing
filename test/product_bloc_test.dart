import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latihan_unit_testing/bloc/product_bloc.dart';
import 'package:latihan_unit_testing/model/product.dart';

void main() {
  group("Product Bloc Test", () {
    blocTest("Initial value",
        build: () => ProductBloc(), expect: [ProductInitial()]);

    blocTest("Add Product",
        build: () => ProductBloc(),
        act: (bloc) async {
          bloc.add(AddProduct(Product("Apel", 2000)));
        },
        expect: [
          ProductInitial(),
          ProductLoaded([Product("Apel", 2000)])
        ]);

    blocTest("Add2 Product",
        build: () => ProductBloc(),
        act: (bloc) async {
          bloc.add(AddProduct(Product("Apel", 2000)));
          bloc.add(AddProduct(Product("Durian", 50000)));
        },
        expect: [
          ProductInitial(),
          ProductLoaded([Product("Apel", 2000)]),
          ProductLoaded([Product("Apel", 2000), Product("Durian", 50000)])
        ]);

    blocTest("Remove Product",
        build: () => ProductBloc(),
        act: (bloc) async {
          bloc.add(RemoveProduct(Product("Apel", 2000)));
        },
        expect: [
          ProductInitial(),
        ]);

    blocTest("Remove Product (Product Loaded)",
        build: () => ProductBloc(),
        act: (bloc) async {
          bloc.add(AddProduct(Product("Apel", 2000)));
          bloc.add(RemoveProduct(Product("Apel", 2000)));
        },
        expect: [
          ProductInitial(),
          ProductLoaded([Product("Apel", 2000)]),
          ProductLoaded([])
        ]);
  });
}
