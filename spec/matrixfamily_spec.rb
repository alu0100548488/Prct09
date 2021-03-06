require 'matrixfamily'

describe Fraccion do
  
   before :each do
      @f = Fraccion.new(10,-30)
      @f2 = Fraccion.new(4,-30)
   end
      
      it "Existe un numerador" do
         @f.n.should eq(10)
      end
      
      it "Existe un denominador" do
         @f.d.should eq(-30)
      end
   
      it "Forma reducida" do
      @f.reducir(@f).should eq(Fraccion.new(1,-3))
      end

      it "Metodo num() para obtener el numerador" do
         @f.num().should eq(10)
      end
      
      it "Metodo denom() para obtener el denominador" do
         @f.denom().should eq(-30)
      end

      it "Mostrar la fraccion de la forma a/b" do
         @f.to_s.should match "10/-30"
      end
      
      it "Mostrar la fraccion en forma flotante" do
         @f.flotante.should eq(-0.3)
      end
   
      it "Sumar dos fracciones con resultado en forma reducida" do
         @f.+(@f2).should eq(Fraccion.new(7,-15))
      end
      
      it "Restar dos fracciones con resultado en forma reducida" do
         @f.-(@f2).should eq(Fraccion.new(1,-5))
      end
      
      it "Multiplicar dos fracciones con resultado en forma reducida" do
         @f.*(@f2).should eq(Fraccion.new(2,45))
      end
      
      it "Sumar dos fracciones con resultado en forma reducida" do
         @f./(@f2).should eq(Fraccion.new(5,2))
      end
      
      it "Valor absoluto de una fraccion" do
         @f.abs
         @f.numerador.should eq(10)
         @f.denominador.should eq(30)
      end

      it "Reciproco de una fraccion" do
         @f.reciprocal
         @f.numerador.should eq(-30)
         @f.denominador.should eq(10)
      end
      
      it "Compara si dos fracciones son iguales" do
         @f3 = Fraccion.new(10,-30)
         @f4 = Fraccion.new(4,22)
         @f.==(@f3).should be true
         @f.==(@f4).should be false
      end
      
      it "Compara si una fraccion es menor que otra" do
         @f3 = Fraccion.new(1,3)
         @f4 = Fraccion.new(-16,2)
         @f.<(@f3).should be true
         @f.<(@f4).should be false
      end
      
      it "Compara si una fraccion es menor o igual que otra" do
         @f3 = Fraccion.new(10,-30)
         @f4 = Fraccion.new(1,2)
         @f.<=(@f3).should be true
         @f.<=(@f4).should be false
      end
      
      it "Compara si una fraccion es mayor o igual que otra" do
         @f3 = Fraccion.new(10,-30)
         @f4 = Fraccion.new(-10,2)
         @f.>=(@f3).should be false
         @f.>=(@f4).should be true
      end
end

describe Matriz_densa do

        before :each do
                @Matriz_densa = Matriz_densa.new([1,2,3],[4,5,6],[7,8,9])
                @Matriz_densa1 = Matriz_densa.new([1,2],[4,5])
                @Matriz_densa2 = Matriz_densa.new([3,2,1],[6,5,4],[9,8,7])
                @Matriz_densa5 = Matriz_densa.new([Fraccion.new(1,3),Fraccion.new(2,3)],[Fraccion.new(3,4),Fraccion.new(5,9)])
                @Matriz_densa6 = Matriz_densa.new([Fraccion.new(1,5),Fraccion.new(5,3)],[Fraccion.new(5,4),Fraccion.new(6,9)])
        end
	
        it "Comprueba que la Matriz_densa es cuadrada" do
                expect { Matriz_densa.new([2,3,3],[3,4],[1,2,3]) }.to raise_error
                expect { Matriz_densa.new([2,3,3],[1,2,3]) }.to raise_error
        end

        it "Accede a los elementos de la Matriz_densa" do
                @Matriz_densa[0][0].should eq(1)
                @Matriz_densa[0][1].should eq(2)
                @Matriz_densa[0][2].should eq(3)
                @Matriz_densa[1][0].should eq(4)
                @Matriz_densa[1][1].should eq(5)
                @Matriz_densa[1][2].should eq(6)
                @Matriz_densa[2][0].should eq(7)
                @Matriz_densa[2][1].should eq(8)
                @Matriz_densa[2][2].should eq(9)
                @Matriz_densa5[0][0].should eq(Fraccion.new(1,3))
        end

        it "Suma dos matrices" do
                @Matriz_densa3 = @Matriz_densa + @Matriz_densa2
                @Matriz_densa7 = @Matriz_densa5 + @Matriz_densa6
                @Matriz_densa8 = @Matriz_densa1 + @Matriz_densa6
                @Matriz_densa3[0][0].should eq(4)
                @Matriz_densa3[0][1].should eq(4)
                @Matriz_densa3[0][2].should eq(4)
                @Matriz_densa3[1][0].should eq(10)
                @Matriz_densa3[1][1].should eq(10)
                @Matriz_densa3[1][2].should eq(10)
                @Matriz_densa3[2][0].should eq(16)
                @Matriz_densa3[2][1].should eq(16)
                @Matriz_densa3[2][2].should eq(16)
                @Matriz_densa7[0][0].should eq(Fraccion.new(8,15))
                @Matriz_densa8[0][0].should eq(Fraccion.new(6,5))
        end

        it "Halla el maximo de una matriz" do
                max = @Matriz_densa.maximo
                max.should eq(9)
        end

        it "Halla el minimo de una matriz" do
                min = @Matriz_densa.minimo
                min.should eq(1)
        end

        it "Resta dos matrices" do
                @Matriz_densa3 = @Matriz_densa - @Matriz_densa2
                @Matriz_densa7 = @Matriz_densa5 - @Matriz_densa6
                @Matriz_densa8 = @Matriz_densa1 - @Matriz_densa6
                @Matriz_densa3[0][0].should eq(-2)
                @Matriz_densa3[0][1].should eq(0)
                @Matriz_densa3[0][2].should eq(2)
                @Matriz_densa3[1][0].should eq(-2)
                @Matriz_densa3[1][1].should eq(0)
                @Matriz_densa3[1][2].should eq(2)
                @Matriz_densa3[2][0].should eq(-2)
                @Matriz_densa3[2][1].should eq(0)
                @Matriz_densa3[2][2].should eq(2)
                @Matriz_densa7[0][0].should eq(Fraccion.new(2,15))
                @Matriz_densa8[0][0].should eq(Fraccion.new(-4,5))
        end

        it "Multiplica dos matrices" do
                @Matriz_densa3 = @Matriz_densa * @Matriz_densa2
                @Matriz_densa7 = @Matriz_densa5 * @Matriz_densa6
                @Matriz_densa8 = @Matriz_densa1 * @Matriz_densa6
                @Matriz_densa3[0][0].should eq(42)
                @Matriz_densa3[0][1].should eq(36)
                @Matriz_densa3[0][2].should eq(30)
                @Matriz_densa3[1][0].should eq(96)
                @Matriz_densa3[1][1].should eq(81)
                @Matriz_densa3[1][2].should eq(66)
                @Matriz_densa3[2][0].should eq(150)
                @Matriz_densa3[2][1].should eq(126)
                @Matriz_densa3[2][2].should eq(102)
                @Matriz_densa7[0][0].should eq(Fraccion.new(9,10))
                @Matriz_densa8[0][0].should eq(Fraccion.new(27,10))
        end
end

describe Matriz_dispersa do

        before :each do
                @Matriz_dispersa = Matriz_dispersa.new(100 => {100 => 1, 500 => 200}, 20000 => { 1000 => 3, 9000 => 200})
                @Matriz_dispersa2 = Matriz_dispersa.new(100 => {100 => 2, 50 => 3}, 200 => { 30 => 10})
                @Matriz_frac = Matriz_dispersa.new(0 => {0 => Fraccion.new(1,3), 1 => Fraccion.new(1,3)}, 2 => {0 => Fraccion.new(1,3), 2 => Fraccion.new(1,3)})
                @Matriz_frac2 = Matriz_dispersa.new(0 => {0 => Fraccion.new(6,3), 1 => Fraccion.new(5,3)}, 2 => {0 => Fraccion.new(5,3), 2 => Fraccion.new(2,3)})
        end
	
        it "Accede a los elementos de la matriz" do
                @Matriz_dispersa[0][0].should eq(0)
                @Matriz_dispersa[100][100].should eq(1)
                @Matriz_dispersa[100][500].should eq(200)
        end

        it "Suma una matriz dispersa con otra" do
                @Matriz_dispersa3 = @Matriz_dispersa + @Matriz_dispersa2
                @Matriz_dispersa3[100][100].should eq(3)
                @Matriz_dispersa3[100][50].should eq(3)
                @Matriz_dispersa3[100][500].should eq(200)
                @Matriz_dispersa3[200][30].should eq(10)
                @Matriz_dispersa3[20000][1000].should eq(3)
                @Matriz_dispersa3[20000][9000].should eq(200)
                @Matriz_dispersa4 = @Matriz_frac + @Matriz_frac2
                @Matriz_dispersa4[0][0].should eq(Fraccion.new(7,3))
                @Matriz_dispersa4[0][1].should eq(Fraccion.new(2,1))
                @Matriz_dispersa4[2][0].should eq(Fraccion.new(2,1))
        end

        it "Resta una matriz dispersa con otra" do
                @Matriz_dispersa3 = @Matriz_dispersa - @Matriz_dispersa2
                @Matriz_dispersa3[100][100].should eq(-1)
                @Matriz_dispersa3[100][50].should eq(3)
                @Matriz_dispersa3[100][500].should eq(200)
                @Matriz_dispersa3[200][30].should eq(10)
                @Matriz_dispersa3[20000][1000].should eq(3)
                @Matriz_dispersa3[20000][9000].should eq(200)
        end

        it "Multiplica una matriz dispersa con otra" do
                @a = Matriz_dispersa.new(0 => {0 => 7, 1 => 1}, 2 => {0 => 2, 2 => 3})
                @b = Matriz_dispersa.new(0 => {0 => 2, 1 => 3}, 1 => {0 => 2}, 2 => {2 => 1})
                @c = Matriz_dispersa.new(0 => {0 => 1}, 1 => {1 => 2}, 2 => {2 => 2})
                @d = Matriz_dispersa.new(0 => {0 => 3, 2 => 2}, 2 => {0 => 1, 2 => 2})
                @e = Matriz_dispersa.new(0 => {1 => 2, 2 => 1}, 1 => {1 => 3}, 3 => {0 => 1})
                @f = Matriz_dispersa.new(1 => {1 => 1, 2 => 3}, 2 => {0 => 2})
                @g = @Matriz_frac * @Matriz_frac2
                @g[0][0].should eq(Fraccion.new(2,3))
                @Matriz_dispersa3 = @a * @b
                @Matriz_dispersa3[0][0].should eq(16)
                @Matriz_dispersa3[0][1].should eq(21)
                @Matriz_dispersa3[2][0].should eq(4)
                @Matriz_dispersa3[2][1].should eq(6)
                @Matriz_dispersa3[2][2].should eq(3)
                @Matriz_dispersa4 = @c * @d
                @Matriz_dispersa4[0][0].should eq(3)
                @Matriz_dispersa4[0][2].should eq(2)
                @Matriz_dispersa4[2][0].should eq(2)
                @Matriz_dispersa4[2][2].should eq(4)
                @Matriz_dispersa4 = @e * @f
                @Matriz_dispersa4[0][0].should eq(2)
                @Matriz_dispersa4[0][1].should eq(2)
                @Matriz_dispersa4[0][2].should eq(6)
                @Matriz_dispersa4[1][1].should eq(3)
                @Matriz_dispersa4[1][2].should eq(9)
        end
	
        it "Opera una matriz dispersa con una densa" do
                @densa = Matriz_densa.new([1,2,4],[4,3,2],[7,6,4])
                @dispersa = Matriz_dispersa.new(1 => {1 => 1, 2 => 3}, 2 => {0 => 2})
                @suma = @densa + @dispersa
                @suma[0][0].should eq(1)
                @suma[0][1].should eq(2)
                @suma[0][2].should eq(4)
                @suma[1][0].should eq(4)
                @suma[1][1].should eq(4)
                @suma[1][2].should eq(5)
                @suma[2][0].should eq(9)
                @suma[2][1].should eq(6)
                @suma[2][2].should eq(4)

                @mult = @densa * @dispersa
                @mult[0][0].should eq(8)
                @mult[0][1].should eq(2)
                @mult[0][2].should eq(6)
                @mult[1][0].should eq(4)
                @mult[1][1].should eq(3)
                @mult[1][2].should eq(9)
                @mult[2][0].should eq(8)
                @mult[2][1].should eq(6)
                @mult[2][2].should eq(18)
        end

        it "Halla el maximo de una matriz" do
                max = @Matriz_dispersa.maximo
                max.should eq(200)
        end

        it "Halla el minimo de una matriz" do
                min = @Matriz_dispersa.minimo
                min.should eq(1)
        end
end