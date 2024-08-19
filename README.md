# Ecossistema da Linguagem

## Parte 1 - Quem criou e por quê?

- **Criador**: Elixir foi criado por José Valim, um desenvolvedor brasileiro, em 2011. Ele é uma figura ativa na comunidade Elixir e continua contribuindo para o desenvolvimento da linguagem.

- **Instituição Mantenedora**: Elixir é mantido pela Plataformatec, uma empresa de consultoria de software cofundada por José Valim. Embora a Plataformatec tenha sido adquirida pela Nubank, a comunidade Elixir e a Elixir Core Team continuam a manter a linguagem.

- **Problema Resolvido**: José Valim criou o Elixir para resolver problemas de concorrência, escalabilidade e desempenho ao construir sistemas distribuídos e de baixa latência. Ele queria trazer uma linguagem moderna para o ecossistema Erlang, que oferece uma VM robusta, mas com uma sintaxe mais acessível e ferramentas mais modernas.

## Parte 2 - Ecossistema Auxiliar

- **Sistema de Pacotes e Bibliotecas**: O Elixir utiliza o Hex como gerenciador de pacotes, onde desenvolvedores podem publicar e compartilhar pacotes de código aberto.

- **Gerenciamento de Dependências**: O gerenciamento de dependências é feito através do Mix, uma ferramenta de build que também facilita a criação, compilação e execução de projetos Elixir.

- **Gerenciador de Versões**: Embora o Elixir em si não tenha um gerenciador de versões integrado, ferramentas como asdf permitem gerenciar diferentes versões do Elixir no mesmo sistema.

- **Fontes de Aprendizado**: Existem vários recursos para aprender Elixir, incluindo o livro “Programming Elixir” de Dave Thomas, além de tutoriais online gratuitos como os oferecidos pela comunidade oficial do Elixir.

## Parte 3 - Código Simples e Usos

- **Hello Word**: 

```elixir
IO.puts("Hello, World!")
```

- **Soma e Condicional**:

```elixir
defmodule Example do
  def sum(a, b), do: a + b

  def check(x) do
    if x > 10 do
      "Greater than 10"
    else
      "10 or less"
    end
  end
end
```

- **Principais Usos**: Elixir é amplamente utilizado em desenvolvimento web (principalmente com o framework Phoenix), sistemas distribuídos e processamento em tempo real. Sua principal “killer application” é o Phoenix Framework, que é conhecido por seu desempenho em aplicações web altamente escaláveis.

- **Funcionalidade Interessante**: Uma funcionalidade que diferencia Elixir de outras linguagens é o suporte nativo para concorrência massiva, possibilitado pelo uso da VM do Erlang, o que permite criar milhões de processos leves que são escaláveis e robustos.

## Parte 4 - Pessoas e Comunidade

- **Principais Eventos**: Alguns dos eventos mais conhecidos são a ElixirConf (realizada anualmente nos EUA e em outras regiões) e o Lambda Days.

- **Comunidade no Brasil**: O Brasil tem uma comunidade ativa de Elixir, com eventos como o Elixir Brasil.

- **Pessoas de Referência**: Além de José Valim, outros nomes de destaque incluem Chris McCord, criador do Phoenix Framework, e Sophie DeBenedetto. No Brasil, nomes como Tiago Davi e Eric Meadows-Jönsson são referências.

# Sistmas de Tipos

## Parte 1 - Tipos Primitivos

### Números e Pontos Flutuantes:

- Elixir lida com números inteiros (integer) e flutuantes (float). A precisão de ponto flutuante é similar ao de outras linguagens modernas, com suporte a operações básicas e aritméticas.

```elixir
a = 42 #Inteiro
b = 3.14 #Flutuante
```

### Strings
- Em Elixir, strings são imutáveis e representadas como sequências de bytes. Elas suportam interpolação e funções sofisticadas para manipulação.

```elixir
str = "Hello, Word!"
```

### Coleções

- Elixir oferece listas e tuplas como tipos principais de coleção. Listas são flexíveis e podem armazenar diferentes tipos de dados. Tuplas são usadas para armazenar dados de forma agrupada e têm acesso rápido.

```elixir
list = [1,2,3]
tuple = {:ok, "success"}
```

## Parte 2 - Sistema de Tipos

- **Forte ou Fraco**: Elixir tem um sistema de tipos forte, o que significa que não permite operações inválidas entre tipos diferentes sem conversão explícita.

- **Estático ou Dinâmico**: Elixir tem um sistema de tipos dinâmico, onde o tipo das variáveis é determinado em tempo de execução.

- **Tipos Imutáveis**: A maioria dos tipos em Elixir são imutáveis, incluindo listas e strings. Isso significa que operações que alteram uma coleção ou string resultam em uma nova coleção ou string, sem modificar a original.

## Parte 3 - Criando um Tipo

Para criar um tipo que lida com conversões de métricas, podemos utilizar structs em Elixir:

```elixir
defmodule Measurement do
  defstruct value: 0, unit: :cm

  def to_inches(%Measurement{value: v, unit: :cm}) do
    %Measurement{value: v / 2.54, unit: :inch}
  end

  def to_cm(%Measurement{value: v, unit: :inch}) do
    %Measurement{value: v * 2.54, unit: :cm}
  end
end
```

Este módulo define uma estrutura para representar medições e funções para converter entre centímetros e polegadas.

