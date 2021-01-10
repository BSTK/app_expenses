class Semana {

  static Map<int, String> get dias {
    return {
      1: 'Domingo',
      2: 'Segunda Feira',
      3: 'Terça Feira',
      4: 'Quarta Feira',
      5: 'Quinta Feira',
      6: 'Sexta Feira',
      7: 'Sábado'
    };
  }

  static String dia(int index) {
    if (index > dias.length || index < 0) {
      throw Exception('Index invalido!');
    }

    for (final diaSemana in dias.entries) {
      if (diaSemana.key == index) {
        return diaSemana.value;
      }
    }

    throw Exception('Index invalido!');
  }

}
