#Hello Word
IO.puts("Hello, World!")

#Variaveis
a = 42      # Inteiro
b = 3.14    # Flutuante
str = "Hello" #string
list = [1,2,3] #lista
tuple = {:ok, "success"}

#Funcao
defmodule Example do
  def sum(a, b), do: a + b

  def check(x) do
    if x > 10 do
      "Maior que 10"
    else
      "menor que 10"
    end
  end
end

#Criando um Tipo

defmodule Measurement do
  # Define a struct Measurement com os campos :value e :unit
  defstruct value: 0, unit: :cm

  # Função para converter de centímetros para polegadas
  def to_inches(%Measurement{value: v, unit: :cm}) do
    %Measurement{value: v / 2.54, unit: :inch}
  end

  # Função para converter de polegadas para centímetros
  def to_cm(%Measurement{value: v, unit: :inch}) do
    %Measurement{value: v * 2.54, unit: :cm}
  end
end

#printando as funcoes
IO.puts Example.sum(a,b)
IO.puts Example.check(15)
IO.puts Example.check(8)

#printando as variaveis
IO.puts(str)
IO.puts inspect(list) #imprime como uma string
IO.puts inspect(tuple) #imprime como uma string

defmodule Main do
  def run do
    # Criando uma struct Measurement em centímetros
    measurement_cm = %Measurement{value: 10, unit: :cm}

    # Convertendo para polegadas
    measurement_inch = Measurement.to_inches(measurement_cm)

    # Imprimindo o resultado completo
    IO.inspect(measurement_inch)

    # Imprimindo os valores individuais
    IO.puts("Value: #{measurement_inch.value}, Unit: #{measurement_inch.unit}")

    # Convertendo de volta para centímetros
    measurement_cm_back = Measurement.to_cm(measurement_inch)

    # Imprimindo o resultado completo
    IO.inspect(measurement_cm_back)

    # Imprimindo os valores individuais
    IO.puts("Value: #{measurement_cm_back.value}, Unit: #{measurement_cm_back.unit}")
  end
end

# Executando a função run no módulo Main
Main.run()
