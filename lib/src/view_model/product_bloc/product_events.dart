//this events class

abstract class ProductEvents {
}

class ProductEvent extends ProductEvents{

  ProductEvent();
}


class LocallySearchProductEvent extends ProductEvents{
  String? searchText;
  LocallySearchProductEvent({this.searchText});

}


