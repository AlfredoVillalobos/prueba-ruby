opcion = 0
menu = <<MENU
Seleciona una opción
1.Generear un archivo y ingresa los datos
2.Total  de inasistencias
3.Alumnos aprovados
4.Salir
MENU

def opcion_1
  alumnos = gets
  File.open('Alumnos.csv', 'a') { |file| file.print alumnos }
  print "\n\n"
end

def opcion_2
  file = File.open('Alumnos.csv', 'r')
  inasistencias = file.readlines
  file.close
  inasistencias.each do |inasistencia|
    total = inasistencia.split(', ').map(&:chomp)
    print total[0] + " = #{total.count('A')}"
    print "\n"
  end
end

def opcion_3
  file = File.open('Alumnos.csv', 'r')
  aprovados = file.readlines
  file.close
  aprovados
end

while opcion != 4
  print menu
  opcion = gets.to_i
  case opcion
  when 1
    opcion_1
  when 2
    opcion_2
  when 3
    opcion_3
  when 4
    print "Elegiste salir \n\n"
  else
    print 'Opcion invalida'
  end
end