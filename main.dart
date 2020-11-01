import 'package:flutter/material.dart';
import 'models.dart';
import 'controllers.dart';

void main() {
  runApp(MaterialApp(
    title: 'Aliexpress',
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _lista1 = ['Vacina COVID-19', 'iPhone 13', 'Playstation 6', 'Dell XPSY','AR-15 Ammo', 'Blade Runner 2059'];
  var _listacart = List<Item>();
  var controler = Itemcontroler();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controler.GetData().then((data) {
        setState(() {
          _listacart = controler.adicionar;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aliexpress'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(icon: Icon(Icons.local_grocery_store), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => carrinho(_listacart),));
            })
          ],
        ),
        body:Column(
          children: [
            for(int i=0; i<_lista1.length; i++)
              Card(child: Row(children: [ Text('${_lista1[i]}'), IconButton(icon: Icon(Icons.control_point), onPressed: (){setState((){
                controler.create(Item(nome: _lista1[i]));
                _listacart = controler.adicionar;
              });
              })],
              )),
          ],)
    );
  }
}
class carrinho extends StatefulWidget {
  @override
  var _listacart = List<Item>();

  carrinho(this._listacart);
  _carrinhoState createState() => _carrinhoState(_listacart);
}

class _carrinhoState extends State<carrinho> {
  var _listacart = List<Item>();
  _carrinhoState(this._listacart);
  var controler = Itemcontroler();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controler.GetData().then((data) {
        setState(() {
          _listacart = controler.adicionar;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        backgroundColor: Colors.red,
      ),
      body: Scrollbar(
        child:ListView(
          children: [
            for(int i=0;i<_listacart.length;i++)
              Card(child:Row(children: [ Text('${_listacart[i].nome}'), Icon(Icons.check)],),),
          ],
        ),
      ),
    );
  }
}