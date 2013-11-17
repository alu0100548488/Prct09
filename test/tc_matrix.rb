# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Matrix

require "./lib/matrixfamily.rb"
require "test/unit"

class Test_Matrix < Test::Unit::TestCase
        #Fracción...
	def setup
                @a = Fraccion.new(13,3)
                @b = Fraccion.new(46,5)
        end


end
