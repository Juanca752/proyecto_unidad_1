import 'package:flutter/material.dart';
import 'package:proyecto_unidad1/widgets/casting_slider.dart';
import 'package:proyecto_unidad1/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //recibir argumentos de otra pantalla 
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin Nombre';
    return Scaffold(
      body: CustomScrollView(
        //widget con comportamiento  predefinidos al scroll
        slivers: [
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate.fixed([
            _PosterAndTitle(),
             _Overview(),
             CastingSlider(),
          ]
          ))
        ],
      ),
    );
  }
}
class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //widget para que se ajuste el tamaño 
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //eliminar el padding
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle(fontSize: 18),),

        ),
        background: FadeInImage(
          placeholder:  AssetImage('assets/loading.gif'),
          image: AssetImage('assets/camarita.jpg'),
        ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/camarita.jpg'),
              image: AssetImage('assets/camarita.jpg'),
              height: 250,
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'movie.title',
                style: TextStyle(fontSize: 30),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,),
                Text(
                  'movie.titleOriginal',
                style: TextStyle(fontSize: 30),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,),
                Row(
                  children: [
                    Icon(Icons.star_outline,
                    size: 20,
                    color: Colors.blueAccent,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      'movie.titleAverage',
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                )
              ],
              ),
             ),
        ]
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,),
      child: const Text('Exercitation xd nojceiji',
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 15),
      ),
    );
  }
}

class CastingSlider extends StatelessWidget {
  const CastingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      color: Colors.yellow,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20), //separacion Horizontal de 20 pixeles
          child: Text(
            'Actores',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (_, int index) => const _CastingPoster(),
          ),
        )
      ]),
    );
  }
}

//Crear las tarjetas
class _CastingPoster extends StatelessWidget {
  const _CastingPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/camarita.jpg'),
                image: AssetImage('assets/camarita.jpg'),
                width: 130,
                height: 165,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Actores.name',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}