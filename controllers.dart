import 'package:lucasbaesseteste2/models.dart';
import 'package:lucasbaesseteste2/repository.dart';

class Itemcontroler{

  List<Item> adicionar=new List<Item>();
  ItemRepository repository=new ItemRepository();

  Future<void> GetData()async{
      try{
        final AllList = await repository.readData();
        adicionar.clear();
        adicionar.addAll(AllList);
      }
          catch(e){
            print("erro:"+e.toString());
          }
  }

  void update() async {
      await repository.saveData(adicionar);
      await GetData();
  }

  Future<void> create(Item dado) async{
    try{
      adicionar.add(dado);
      await update();
    }
      catch(e){
        print("erro:"+e.toString());
      }
  }





}