#função atribuída a uma variável
minha_funcao = fn x -> x * 2 end
IO.puts(minha_funcao.(10))


defmodule Exemplo do
  def aplicar_funcao(valor, funcao) do
    funcao.(valor)
  end
end

IO.puts(Exemplo.aplicar_funcao(5, fn x -> x + 3 end))

lista = [1, 2, 3, 4]
Enum.map(lista, fn x -> x * 2 end) |> IO.inspect(label: "Dobrado")


lista = [1, 2, 3, 4, 5]

# Map
Enum.map(lista, fn x -> x * x end)

# Reduce
Enum.reduce(lista, 0, fn x, acc -> x + acc end)

# Filter
Enum.filter(lista, fn x -> rem(x, 2) == 0 end)


lista = [1, 2, 3, 4, 5]
lista
|> Enum.map(&(&1 * 2))
|> Enum.filter(&(&1 > 5))
|> IO.inspect(label: "Resultado")


# Função de adição
adicao = fn a, b -> a + b end

adicionar_cinco = fn x -> adicao.(5, x) end
IO.puts(adicionar_cinco.(3))
