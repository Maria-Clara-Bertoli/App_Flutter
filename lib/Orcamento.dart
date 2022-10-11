class Orcamento{
double _massa = 0;
double _valor = 0;
List <Orcamento> lista = [];

  setMassa(double massa){
    this._massa = massa;
  }

  getMassa(){
    return this._massa;
  }

  setValor(double valor){
    this._valor = valor;
  }

  getValor(){
    return this._valor;
  }

  calculaOrcamento(){
    double resultado = getMassa() * getValor();
    String resultadostr = resultado.toStringAsPrecision(2);
    return resultadostr;
  }

  calculaOrcamentoDouble(){
    double resultado = getMassa() * getValor();
    return resultado;
  }

  somaOrcamento(double valor1, double valor2, double valor3){
    double soma = valor1 + valor2 + valor3;
    String resultado = soma.toStringAsPrecision(2);
    return resultado;
  }
}