//calculadora en elixir
def suma(n1, n2) do
  n1 + n2
end
def resta(n1,n2) do
  n1 - n2
end
def multiplicacion(n1, n2) do
  n1 * n2
end
def division(n1,n2) do
  n1 / n2
end
end

//funciones con argumentos
defmodule Calculadora do
  def suma(n1,n2) do
    n1 + n2
end

//Invocaciones internas de una función no requieren del prefijo del nombre del módulo

defmodule Geometria do
  def perimetro1(l), do: cuadrado(l)
  def perimetro2(l), do: Geometria.cuadrado(l)
  def cuadrado(l), do: 4*l
end

//Se pueden utilizar funciones privadas con el constructor defp
//Función Publica y privada

defmodule TestPublicoPrivado do
  def funcion_publica(msg) do
  IO.puts("#{msg} publico")
  funcion_privada(msg)
end
defp funcion_privada(msg) do
  IO.puts("#{msg} privado")
end
end

//Haciendo que una función dependa de otra de diferente aridad, se podría realizarlo siguiente:

defmodule Calculadora do
  def suma(n) do
  suma(n,0)
end
def suma(n1,n2) do
  n1 + n2
end
end

//import

import ModuloImportado
defmodule ModuloMain do
def main do
  IO.puts("Funcion main")
  funcion_importada("Esta funcion es importada")
end
end

//Creamos el Módulo a importar modsec.ex
//Escribimos el siguiente código:

defmodule ModuloImportado do
  def funcion_importada(msg) do
  IO.puts(msg)
end
end

//Existen los atributos en tiempo de compilación (Mientras están cargados)

defmodule Geometria do
  @pi 3.141592
  def area(r) do
  r*r*@pi
end
def circunferencia(r) do
  2 * r * @pi
end
end

//Elixir permite el registro de atributos, que se almacenarán en el archivo binario.

defmodule Geometria do
  @moduledoc "Calcula el area y el perimetro de un circulo"
  @pi 3.141592
  @doc "calcula el area del circulo"
  def area(r), do: r*r*@pi
  @doc "calcula el perimetro de un circulo"
  def circunferencia(r), do: 2 * r * @pi
end

//Funciones

defmodule Calculadora do
  def div(_,0) do
  {:error, "No se puede dividir por 0"}
end
def div(n1, n2) do
  {:ok, "El resultado es: #{n1/n2}"}
 end
end
IO.inspect(Calculadora.div(5,0))
IO.inspect(Calculadora.div(5,3))

//Guardas

defmodule Numero do
  def cero?(0), do: true
  def cero?(n) when is_integer(n), do: false
  def cero?(_), do: "No es entero"
end

IO.puts(Numero.cero?(0))
IO.puts(Numero.cero?(2))
IO.puts(Numero.cero?("3"))

//condicional "if"

defmodule Persona1 do
  def sexo(sex) do
    if sex == :m do
      "Masculino"
    else
      "Femenino"
    end
  end
end

//"case"

defmodule Persona3 do
  def sexo(sex) do
    case sex do
      :m -> "Masculino"
      :f -> "Femenino"
      _ -> "Sexo desconocido"
    end
  end
end

//Documentación con ExDoc
//Abrir el archivo mix.exs
//Modificar las dependencias agregando {:ex_doc, “~>0.12”}

defp deps do
  [
    {:ex_doc, "~>0.12"}
  ]
end

//unless

defmodule MayorDeEdad do
  def mayor1(edad) do
    unless edad >= 18 do
      "Es menor de edad"
    end
  end
end

//Operador Pipe
//Dada una lista con n numeros, se desea obtener el cuadrado de la suma de los
//elementos de la cola. Si la lista es [1,2,3,4,5], el resultado es (2+3+4+5)^2
//csc = cuadrado(suma(2,3,4,5))

sum = 0
lista = [1,2,3,4,5]
lista = tl(lista)
IO.inspect(lista)
[num|lista] = lista
#para sacar el 2
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
#para sacar el 3
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
#para sacar el 4
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
#para sacar el 5
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
IO.puts("EL resultado es: #{sum*sum}")


//for
//Contar del 1 al 10

for x <- 1..10 do
  IO.puts(x)
end

//Ejercicios de recursión

defmodule Repetir do
  def imprimir(msg, n) when n<= 1 do
    IO.puts("#{n}: #{msg}")
  end
  def imprimir(msg, n) do
    IO.puts("#{n}: #{msg}")
    imprimir(msg, n-1)
  end
end

//Generar n calificaciones aleatorias entre 0 y 10 y obtener su promedio

max = 50
calificaciones = for _x <- 1..max do
  Enum.random(0..10)
end
IO.inspect(calificaciones)
IO.puts Enum.count(calificaciones)
IO.puts Enum.sum(calificaciones)/Enum.count(calificaciones)


//Hacer un programa recursivo que cuente de manera creciente de li (límite
//inferior) a ls (límite superior) para li>=ls inclusive

defmodule For_range do
  def for_to(n,ls) when n > ls do
    IO.puts "error"
  end
  def for_to(n,ls) when n >= ls do
    IO.puts n
  end
  def for_to(n,ls) do
    IO.puts n
  for_to(n + 1,ls)
  end
end
IO.puts("Contar de 1 a 10")
For_range.for_to(1,10)
IO.puts("Contar de 12 a 5")
For_range.for_to(12,5)

//Programa que sume los valores de los números consecutivos entre li y ls
//inclusive

defmodule For_range do
  def for_to(n,ls) when n >= ls do
    n
  end
  def for_to(n,ls) do
    n + for_to(n + 1,ls)
  end
end
IO.puts("suma de los numeros de 1 a 10")
IO.puts For_range.for_to(1,10)
IO.puts("suma de los numeros 5 a 12")
IO.puts For_range.for_to(5,12)