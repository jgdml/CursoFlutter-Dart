import 'package:clima/services/api.dart';
import 'package:clima/services/localizacao.dart';
import 'package:clima/services/network.dart';

class Tempo {
  static Future<dynamic> getTempo() async {
    var localizacao = Localizacao();

    await localizacao.getLocalizacao();

    var requisicao = await Network(
            "${API.apiUrl}?appid=${API.key}&lat=${localizacao.latitude}&lon=${localizacao.longitude}&units=metric")
        .makeRequest();

    return API.fromJson(requisicao);
  }

  static getEmoji(int condicao) {
    if (condicao < 300) {
      return 'ð©';
    } else if (condicao < 400) {
      return 'ð§';
    } else if (condicao < 600) {
      return 'âï¸';
    } else if (condicao < 700) {
      return 'âï¸';
    } else if (condicao < 800) {
      return 'ð«';
    } else if (condicao == 800) {
      return 'âï¸';
    } else if (condicao <= 804) {
      return 'âï¸';
    } else {
      return 'ð¤·â';
    }
  }

  static getDescricao(int temp) {
    if (temp > 28) {
      return 'Ã hora do ð¦';
    } else if (temp > 22) {
      return 'Hora de shorts e ð';
    } else if (temp < 15) {
      return 'VocÃª vai precisar de um ð§£ e ð§¤';
    } else {
      return 'Leve uma ð§¥ para garantir';
    }
  }
}
