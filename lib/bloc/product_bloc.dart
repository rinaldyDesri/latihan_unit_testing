import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latihan_unit_testing/model/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  @override
  ProductState get initialState => ProductInitial();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is AddProduct) {
      if (state is ProductInitial) {
        yield ProductLoaded([event.product]);
      } else {
        yield ProductLoaded(
            (state as ProductLoaded).products + [event.product]);
      }
    } else {
      if (state is ProductInitial) {
        yield state;
      } else {
        yield ProductLoaded((state as ProductLoaded)
            .products
            .where((item) => item != event.product)
            .toList());
      }
    }
  }
}
