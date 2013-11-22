
class Matriz

  def initialize(*col) #col recoge en un array las filas de nuestra matriz.
    
    @matriz = Array.new()
    
    for i in col do
      if i.size == col.size then #nos aseguramos que es una matriz cuadrada.
        @matriz.push(i)
      else
        raise "La matriz debe ser cuadrada"
      end
    end
    
    @dimension = col.size #Guardamos en una variable de instancia la dimension de la matriz.
  
  end

  def [] (*ij) #Recibe un numero de argumentos...
  
  end

  def +(other) #Para la suma de matrices
  
  end

  def -(other) #Para la resta de matrices
  
  end

  def *(other) #Para la multiplicacion de matrices
  
  end
  
end