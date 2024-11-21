#spawn -> executa de forma assincrona
spawn(fn -> IO.puts("Processo paralelo!") end)


defmodule ProcessoExemplo do
  def iniciar do
    pid = spawn(fn -> esperar_mensagem() end)
    send(pid, {:mensagem, "Olá, processo!"})
  end

  defp esperar_mensagem do
    receive do
      {:mensagem, conteudo} ->
        IO.puts("Recebido: #{conteudo}")
    end
  end
end

ProcessoExemplo.iniciar()


# Exemplo de async/await
task = Task.async(fn -> Enum.sum(1..1000000) end)
resultado = Task.await(task)
IO.puts("Resultado: #{resultado}")


defmodule Ator do
  def iniciar do
    spawn(fn -> loop() end)
  end

  defp loop do
    receive do
      {:mensagem, conteudo} ->
        IO.puts("Mensagem recebida: #{conteudo}")
        loop()
    end
  end
end

ator_pid = Ator.iniciar()
send(ator_pid, {:mensagem, "Olá, ator!"})


defmodule MeuServidor do
  use GenServer

  #função para iniciar o servidor
  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  #implementação da função init/1
  def init(initial_state) do
    {:ok, initial_state}
  end

  #função para lidar com mensagens
  def handle_call(:diga_ola, _from, state) do
    {:reply, "Olá, mundo!", state}
  end

  def handle_cast({:mensagem, conteudo}, state) do
    IO.puts("Mensagem recebida: #{conteudo}")
    {:noreply, state}
  end
end

{:ok, _pid} = MeuServidor.start_link(:estado_inicial)

IO.puts(GenServer.call(MeuServidor, :diga_ola))
GenServer.cast(MeuServidor, {:mensagem, "Olá, ator!"})
