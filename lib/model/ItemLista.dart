
class ItemLista{
  final int id;
  final String Nome;
  final int Quantidade;

  ItemLista(this.id,this.Nome, this.Quantidade);

  @override
  String toString() {
    return 'ItemLista{ID: $id ,Nome: $Nome, Quantidade: $Quantidade}';
  }
}