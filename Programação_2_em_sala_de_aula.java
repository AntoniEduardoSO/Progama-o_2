import java.util.Scanner;

class Main {
  public static void main() {
    Scanner input = new Scanner(System.in);
    int escolha = input.nextInt();

    switch(escolha){
        case(1): Usuario("o", "o");
    }
  }  
}

class Projeto{
  public String indetificacao;
  public String descricao;
  public String data_i;
  public String data_f;
  public String coordenador;
  public String atividade;
  public String bolsa;
  public String vigencia_bolsa;

}


class Atividade{
  public String identificacao;
  public String descricao;
  public String responsavel;
}


class Usuario{
  public String nome;
  public String qualificacao;
  private String senha;


  public void cadastro(String nome, String qualificacao){
    this.nome = nome;
    this.qualificacao = qualificacao;
  }

  
  
}



/*
1 - alunos de graduação 
2 - mestrado
3 - doutorado
4 - professores
5 - pesquisadores
6 - profissionais (desenvolvedor, testador e analista)
7 - técnico.

Projeto =
identificação(6 números);
descrição
data e hora de início;
data e hora de término;
coordenador do projeto;
profissionais envolvidos no projeto;
atividades.
Valor da bolsa para cada profissional;
Período de vigência da bolsa.

-------------------------------------------------------------------------------------------

Atividade = 
identificação(3 números iniciais do projeto);
descrição 
data e hora de início;
data e hora de término;
responsável pela atividade;
profissionais envolvidos na atividade;
tarefas a serem realizadas por cada profissional.


Ter 3 classes, sendo usuario projeto e atividades guardando uns aos outros para buscar e associar.
usuario vai herdar projeto e atividades, e tera senha e adicionais.

1 - Cadastrar usuario(Qualificando ele) criar senha. (X)

2 - Criar Projeto(Qualquer um pode criar um projeto) (X)

3 - Situacao de projetos(Informe usuario, caso ele seja não seja coordenador, invalide tudo, se ele for coordenador, mude a tela para informar as seguintes funcionalidades){
 1- iniciar projeto(Mostrar todos os projetos não iniciados por coordenadores, e o coordenador digita a identificador do projeto para inicialo!) (X)
 2- concluir projeto(Mostrar todos os projetos iniciados porem não concluidos para o coordenador, e ele digitarar o identificador do projeto)  (X)
}

4 - Consulta (Criar mais 3 opções){
 1 - consultar por usuario(digitar o nome do usuario e qualificacao). (X)
 2 - consultar por projeto(digitar o indetificador do projeto). (X)
 3 - consultar por atividades(digitar o indetificador das atividades). (X)
}

5 -  Edição.(Criar 2 opçoes){
 1 - editar informações(criar 3 opções: usuario,projeto,atividade) (X)
 2 - remover informações (criar 3 opções: usuario,projeto,atividade) (X)
}

6 - recuperar senha(usuario digita seu nome e identificador de algum projeto que ele esteja evolvido, caso ele não esteja envolvido é preciso um coordenador colocar ele em algum projeto) (X)

*/
