reg_exp = Regexp.new("@shilum")
mencion = { mensaje: { contenido: "Mencion para @shilum" }}
def menciones?(persona, mencion)
	texto = mencion[:mensaje][:contenido]
	reg = Regexp.new("@#{persona}")
	reg === texto
end

puts "Con mencion: "	+ mencion.to_s

# a = reg_exp =~ texto
# puts a
# puts texto === reg_exp
# puts reg_exp === texto

puts menciones?("shilum", mencion)

