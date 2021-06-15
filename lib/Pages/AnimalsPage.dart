import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/models.dart';
import '../mockdata/mockdata.dart';



class AnimalsPage extends StatefulWidget {
  final AnimalClass animalClass;
  AnimalsPage({ required this.animalClass });

  @override
  _AnimalsPageState createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {

  List<Animal> get getAnimal {
    final List<Animal> animalsListCurrent = [];
    animalsListCurrent.addAll(
      animalsList.where((animal) => animal.idClass == widget.animalClass.id)
    );

    return animalsListCurrent;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF303030),
      appBar: AppBar(
        title: Text(widget.animalClass.nameSpecie),
        backgroundColor: Color(0xFF212121),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: getAnimal.length,
          itemBuilder: (context,index){
            return Card(
              elevation: 3,
              color: Color(0xFF616161),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    getAnimal[index].image,
                    fit: BoxFit.cover,
                    width: 400,
                    height: 150,
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    getAnimal[index].specie,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    getAnimal[index].scientificName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16,),
                ],
              ),
            );
          },
        ),
      ),
    );

  }

}