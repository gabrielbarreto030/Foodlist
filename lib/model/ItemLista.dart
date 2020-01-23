
class ItemLista{
  final String Nome;
  final double Quantidade;

  ItemLista(this.Nome, this.Quantidade);

  @override
  String toString() {
    return 'ItemLista{Nome: $Nome, Quantidade: $Quantidade}';
  }
}