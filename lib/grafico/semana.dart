class Semana {

  static Map<int, String> get dias {
    return {
      0: 'Domingo',
      1: 'Segunda Feira',
      2: 'Terça Feira',
      3: 'Quarta Feira',
      4: 'Quinta Feira',
      5: 'Sexta Feira',
      6: 'Sábado'
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
  }

}
