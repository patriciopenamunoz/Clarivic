require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seed generation started:'
puts '###############################'
puts 'Cleaning registers'
HostelRegistration.destroy_all
HostelFeature.destroy_all
RoomType.destroy_all
Hostel.destroy_all
Commune.destroy_all
Region.destroy_all
User.destroy_all

puts 'Creating admin user'
admin = User.new
admin.email = 'admin@admin.com'
admin.password = '123456'
admin.password_confirmation = '123456'
admin.first_name = Faker::Name.first_name
admin.middle_name = Faker::Name.middle_name
admin.first_surname = Faker::Name.last_name
admin.second_surname = Faker::Name.last_name
admin.gender = User.genders.keys.sample
admin.bio = Faker::Hipster.paragraph
admin.access_level = 'admin'
admin.save

puts 'Populing Commune and Region models'
Arica = Region.create(short_name: "Arica y Parinacota", full_name: "Arica y Parinacota")
Commune.create(full_name: "Arica", short_name: "Arica", region: Arica)
Commune.create(full_name: "Camarones", short_name: "Camarones", region: Arica)
Commune.create(full_name: "Putre", short_name: "Putre", region: Arica)
Commune.create(full_name: "General Lagos", short_name: "General Lagos", region: Arica)

Tarapaca = Region.create(short_name: "Tarapacá", full_name: "Tarapacá")
Commune.create(full_name: "Iquique", short_name: "Iquique", region: Tarapaca)
Commune.create(full_name: "Alto Hospicio", short_name: "Alto Hospicio", region: Tarapaca)
Commune.create(full_name: "Pozo Almonte", short_name: "Pozo Almonte", region: Tarapaca)
Commune.create(full_name: "Camiña", short_name: "Camiña", region: Tarapaca)
Commune.create(full_name: "Colchane", short_name: "Colchane", region: Tarapaca)
Commune.create(full_name: "Huara", short_name: "Huara", region: Tarapaca)
Commune.create(full_name: "Pica", short_name: "Pica", region: Tarapaca)

Antofagasta = Region.create(short_name: "Antofagasta", full_name: "Antofagasta")
Commune.create(full_name: "Antofagasta", short_name: "Antofagasta", region: Antofagasta)
Commune.create(full_name: "Mejillones", short_name: "Mejillones", region: Antofagasta)
Commune.create(full_name: "Sierra Gorda", short_name: "Sierra Gorda", region: Antofagasta)
Commune.create(full_name: "Taltal", short_name: "Taltal", region: Antofagasta)
Commune.create(full_name: "Calama", short_name: "Calama", region: Antofagasta)
Commune.create(full_name: "Ollagüe", short_name: "Ollagüe", region: Antofagasta)
Commune.create(full_name: "San Pedro de Atacama", short_name: "San Pedro de Atacama", region: Antofagasta)
Commune.create(full_name: "Tocopilla", short_name: "Tocopilla", region: Antofagasta)
Commune.create(full_name: "María Elena", short_name: "María Elena", region: Antofagasta)

Atacama = Region.create(short_name: "Atacama", full_name: "Atacama")
Commune.create(full_name: "Copiapó", short_name: "Copiapó", region: Atacama)
Commune.create(full_name: "Caldera", short_name: "Caldera", region: Atacama)
Commune.create(full_name: "Tierra Amarilla", short_name: "Tierra Amarilla", region: Atacama)
Commune.create(full_name: "Chañaral", short_name: "Chañaral", region: Atacama)
Commune.create(full_name: "Diego de Almagro", short_name: "Diego de Almagro", region: Atacama)
Commune.create(full_name: "Vallenar", short_name: "Vallenar", region: Atacama)
Commune.create(full_name: "Alto del Carmen", short_name: "Alto del Carmen", region: Atacama)
Commune.create(full_name: "Freirina", short_name: "Freirina", region: Atacama)
Commune.create(full_name: "Huasco", short_name: "Huasco", region: Atacama)

Coquimbo = Region.create(short_name: "Coquimbo", full_name: "Coquimbo")
Commune.create(full_name: "La Serena", short_name: "La Serena", region: Coquimbo)
Commune.create(full_name: "Coquimbo", short_name: "Coquimbo", region: Coquimbo)
Commune.create(full_name: "Andacollo", short_name: "Andacollo", region: Coquimbo)
Commune.create(full_name: "La Higuera", short_name: "La Higuera", region: Coquimbo)
Commune.create(full_name: "Paiguano", short_name: "Paiguano", region: Coquimbo)
Commune.create(full_name: "Vicuña", short_name: "Vicuña", region: Coquimbo)
Commune.create(full_name: "Illapel", short_name: "Illapel", region: Coquimbo)
Commune.create(full_name: "Canela", short_name: "Canela", region: Coquimbo)
Commune.create(full_name: "Los Vilos", short_name: "Los Vilos", region: Coquimbo)
Commune.create(full_name: "Salamanca", short_name: "Salamanca", region: Coquimbo)
Commune.create(full_name: "Ovalle", short_name: "Ovalle", region: Coquimbo)
Commune.create(full_name: "Combarbalá", short_name: "Combarbalá", region: Coquimbo)
Commune.create(full_name: "Monte Patria", short_name: "Monte Patria", region: Coquimbo)
Commune.create(full_name: "Punitaqui", short_name: "Punitaqui", region: Coquimbo)
Commune.create(full_name: "Río Hurtado", short_name: "Río Hurtado", region: Coquimbo)

Valparaiso = Region.create(short_name: "Valparaíso", full_name: "Valparaíso")
Commune.create(full_name: "Valparaíso", short_name: "Valparaíso", region: Valparaiso)
Commune.create(full_name: "Casablanca", short_name: "Casablanca", region: Valparaiso)
Commune.create(full_name: "Concón", short_name: "Concón", region: Valparaiso)
Commune.create(full_name: "Juan Fernández", short_name: "Juan Fernández", region: Valparaiso)
Commune.create(full_name: "Puchuncaví", short_name: "Puchuncaví", region: Valparaiso)
Commune.create(full_name: "Quintero", short_name: "Quintero", region: Valparaiso)
Commune.create(full_name: "Viña del Mar", short_name: "Viña del Mar", region: Valparaiso)
Commune.create(full_name: "Isla de Pascua", short_name: "Isla de Pascua", region: Valparaiso)
Commune.create(full_name: "Los Andes", short_name: "Los Andes", region: Valparaiso)
Commune.create(full_name: "Calle Larga", short_name: "Calle Larga", region: Valparaiso)
Commune.create(full_name: "Rinconada", short_name: "Rinconada", region: Valparaiso)
Commune.create(full_name: "San Esteban", short_name: "San Esteban", region: Valparaiso)
Commune.create(full_name: "La Ligua", short_name: "La Ligua", region: Valparaiso)
Commune.create(full_name: "Cabildo", short_name: "Cabildo", region: Valparaiso)
Commune.create(full_name: "Papudo", short_name: "Papudo", region: Valparaiso)
Commune.create(full_name: "Petorca", short_name: "Petorca", region: Valparaiso)
Commune.create(full_name: "Zapallar", short_name: "Zapallar", region: Valparaiso)
Commune.create(full_name: "Quillota", short_name: "Quillota", region: Valparaiso)
Commune.create(full_name: "Calera", short_name: "Calera", region: Valparaiso)
Commune.create(full_name: "Hijuelas", short_name: "Hijuelas", region: Valparaiso)
Commune.create(full_name: "La Cruz", short_name: "La Cruz", region: Valparaiso)
Commune.create(full_name: "Nogales", short_name: "Nogales", region: Valparaiso)
Commune.create(full_name: "San Antonio", short_name: "San Antonio", region: Valparaiso)
Commune.create(full_name: "Algarrobo", short_name: "Algarrobo", region: Valparaiso)
Commune.create(full_name: "Cartagena", short_name: "Cartagena", region: Valparaiso)
Commune.create(full_name: "El Quisco", short_name: "El Quisco", region: Valparaiso)
Commune.create(full_name: "El Tabo", short_name: "El Tabo", region: Valparaiso)
Commune.create(full_name: "Santo Domingo", short_name: "Santo Domingo", region: Valparaiso)
Commune.create(full_name: "San Felipe", short_name: "San Felipe", region: Valparaiso)
Commune.create(full_name: "Catemu", short_name: "Catemu", region: Valparaiso)
Commune.create(full_name: "Llaillay", short_name: "Llaillay", region: Valparaiso)
Commune.create(full_name: "Panquehue", short_name: "Panquehue", region: Valparaiso)
Commune.create(full_name: "Putaendo", short_name: "Putaendo", region: Valparaiso)
Commune.create(full_name: "Santa María", short_name: "Santa María", region: Valparaiso)
Commune.create(full_name: "Quilpué", short_name: "Quilpué", region: Valparaiso)
Commune.create(full_name: "Limache", short_name: "Limache", region: Valparaiso)
Commune.create(full_name: "Olmué", short_name: "Olmué", region: Valparaiso)
Commune.create(full_name: "Villa Alemana", short_name: "Villa Alemana", region: Valparaiso)

Ohiggins = Region.create(short_name: "Libertador Gral. Bernardo O’Higgins", full_name: "Libertador General Bernardo O’Higgins")
Commune.create(full_name: "Rancagua", short_name: "Rancagua", region: Ohiggins)
Commune.create(full_name: "Codegua", short_name: "Codegua", region: Ohiggins)
Commune.create(full_name: "Coinco", short_name: "Coinco", region: Ohiggins)
Commune.create(full_name: "Coltauco", short_name: "Coltauco", region: Ohiggins)
Commune.create(full_name: "Doñihue", short_name: "Doñihue", region: Ohiggins)
Commune.create(full_name: "Graneros", short_name: "Graneros", region: Ohiggins)
Commune.create(full_name: "Las Cabras", short_name: "Las Cabras", region: Ohiggins)
Commune.create(full_name: "Machalí", short_name: "Machalí", region: Ohiggins)
Commune.create(full_name: "Malloa", short_name: "Malloa", region: Ohiggins)
Commune.create(full_name: "Mostazal", short_name: "Mostazal", region: Ohiggins)
Commune.create(full_name: "Olivar", short_name: "Olivar", region: Ohiggins)
Commune.create(full_name: "Peumo", short_name: "Peumo", region: Ohiggins)
Commune.create(full_name: "Pichidegua", short_name: "Pichidegua", region: Ohiggins)
Commune.create(full_name: "Quinta de Tilcoco", short_name: "Quinta de Tilcoco", region: Ohiggins)
Commune.create(full_name: "Rengo", short_name: "Rengo", region: Ohiggins)
Commune.create(full_name: "Requínoa", short_name: "Requínoa", region: Ohiggins)
Commune.create(full_name: "San Vicente", short_name: "San Vicente", region: Ohiggins)
Commune.create(full_name: "Pichilemu", short_name: "Pichilemu", region: Ohiggins)
Commune.create(full_name: "La Estrella", short_name: "La Estrella", region: Ohiggins)
Commune.create(full_name: "Litueche", short_name: "Litueche", region: Ohiggins)
Commune.create(full_name: "Marchihue", short_name: "Marchihue", region: Ohiggins)
Commune.create(full_name: "Navidad", short_name: "Navidad", region: Ohiggins)
Commune.create(full_name: "Paredones", short_name: "Paredones", region: Ohiggins)
Commune.create(full_name: "San Fernando", short_name: "San Fernando", region: Ohiggins)
Commune.create(full_name: "Chépica", short_name: "Chépica", region: Ohiggins)
Commune.create(full_name: "Chimbarongo", short_name: "Chimbarongo", region: Ohiggins)
Commune.create(full_name: "Lolol", short_name: "Lolol", region: Ohiggins)
Commune.create(full_name: "Nancagua", short_name: "Nancagua", region: Ohiggins)
Commune.create(full_name: "Palmilla", short_name: "Palmilla", region: Ohiggins)
Commune.create(full_name: "Peralillo", short_name: "Peralillo", region: Ohiggins)
Commune.create(full_name: "Placilla", short_name: "Placilla", region: Ohiggins)
Commune.create(full_name: "Pumanque", short_name: "Pumanque", region: Ohiggins)
Commune.create(full_name: "Santa Cruz", short_name: "Santa Cruz", region: Ohiggins)

Maule = Region.create(short_name: "Maule", full_name: "Maule")
Commune.create(full_name: "Talca", short_name: "Talca", region: Maule)
Commune.create(full_name: "Constitución", short_name: "Constitución", region: Maule)
Commune.create(full_name: "Curepto", short_name: "Curepto", region: Maule)
Commune.create(full_name: "Empedrado", short_name: "Empedrado", region: Maule)
Commune.create(full_name: "Maule", short_name: "Maule", region: Maule)
Commune.create(full_name: "Pelarco", short_name: "Pelarco", region: Maule)
Commune.create(full_name: "Pencahue", short_name: "Pencahue", region: Maule)
Commune.create(full_name: "Río Claro", short_name: "Río Claro", region: Maule)
Commune.create(full_name: "San Clemente", short_name: "San Clemente", region: Maule)
Commune.create(full_name: "San Rafael", short_name: "San Rafael", region: Maule)
Commune.create(full_name: "Cauquenes", short_name: "Cauquenes", region: Maule)
Commune.create(full_name: "Chanco", short_name: "Chanco", region: Maule)
Commune.create(full_name: "Pelluhue", short_name: "Pelluhue", region: Maule)
Commune.create(full_name: "Curicó", short_name: "Curicó", region: Maule)
Commune.create(full_name: "Hualañé", short_name: "Hualañé", region: Maule)
Commune.create(full_name: "Licantén", short_name: "Licantén", region: Maule)
Commune.create(full_name: "Molina", short_name: "Molina", region: Maule)
Commune.create(full_name: "Rauco", short_name: "Rauco", region: Maule)
Commune.create(full_name: "Romeral", short_name: "Romeral", region: Maule)
Commune.create(full_name: "Sagrada Familia", short_name: "Sagrada Familia", region: Maule)
Commune.create(full_name: "Teno", short_name: "Teno", region: Maule)
Commune.create(full_name: "Vichuquén", short_name: "Vichuquén", region: Maule)
Commune.create(full_name: "Linares", short_name: "Linares", region: Maule)
Commune.create(full_name: "Colbún", short_name: "Colbún", region: Maule)
Commune.create(full_name: "Longaví", short_name: "Longaví", region: Maule)
Commune.create(full_name: "Parral", short_name: "Parral", region: Maule)
Commune.create(full_name: "Retiro", short_name: "Retiro", region: Maule)
Commune.create(full_name: "San Javier", short_name: "San Javier", region: Maule)
Commune.create(full_name: "Villa Alegre", short_name: "Villa Alegre", region: Maule)
Commune.create(full_name: "Yerbas Buenas", short_name: "Yerbas Buenas", region: Maule)

Biobio = Region.create(short_name: "Biobío", full_name: "Biobío")
Commune.create(full_name: "Concepción", short_name: "Concepción", region: Biobio)
Commune.create(full_name: "Coronel", short_name: "Coronel", region: Biobio)
Commune.create(full_name: "Chiguayante", short_name: "Chiguayante", region: Biobio)
Commune.create(full_name: "Florida", short_name: "Florida", region: Biobio)
Commune.create(full_name: "Hualqui", short_name: "Hualqui", region: Biobio)
Commune.create(full_name: "Lota", short_name: "Lota", region: Biobio)
Commune.create(full_name: "Penco", short_name: "Penco", region: Biobio)
Commune.create(full_name: "San Pedro de la Paz", short_name: "San Pedro de la Paz", region: Biobio)
Commune.create(full_name: "Santa Juana", short_name: "Santa Juana", region: Biobio)
Commune.create(full_name: "Talcahuano", short_name: "Talcahuano", region: Biobio)
Commune.create(full_name: "Tomé", short_name: "Tomé", region: Biobio)
Commune.create(full_name: "Hualpén", short_name: "Hualpén", region: Biobio)
Commune.create(full_name: "Lebu", short_name: "Lebu", region: Biobio)
Commune.create(full_name: "Arauco", short_name: "Arauco", region: Biobio)
Commune.create(full_name: "Cañete", short_name: "Cañete", region: Biobio)
Commune.create(full_name: "Contulmo", short_name: "Contulmo", region: Biobio)
Commune.create(full_name: "Curanilahue", short_name: "Curanilahue", region: Biobio)
Commune.create(full_name: "Los Álamos", short_name: "Los Álamos", region: Biobio)
Commune.create(full_name: "Tirúa", short_name: "Tirúa", region: Biobio)
Commune.create(full_name: "Los Ángeles", short_name: "Los Ángeles", region: Biobio)
Commune.create(full_name: "Antuco", short_name: "Antuco", region: Biobio)
Commune.create(full_name: "Cabrero", short_name: "Cabrero", region: Biobio)
Commune.create(full_name: "Laja", short_name: "Laja", region: Biobio)
Commune.create(full_name: "Mulchén", short_name: "Mulchén", region: Biobio)
Commune.create(full_name: "Nacimiento", short_name: "Nacimiento", region: Biobio)
Commune.create(full_name: "Negrete", short_name: "Negrete", region: Biobio)
Commune.create(full_name: "Quilaco", short_name: "Quilaco", region: Biobio)
Commune.create(full_name: "Quilleco", short_name: "Quilleco", region: Biobio)
Commune.create(full_name: "San Rosendo", short_name: "San Rosendo", region: Biobio)
Commune.create(full_name: "Santa Bárbara", short_name: "Santa Bárbara", region: Biobio)
Commune.create(full_name: "Tucapel", short_name: "Tucapel", region: Biobio)
Commune.create(full_name: "Yumbel", short_name: "Yumbel", region: Biobio)
Commune.create(full_name: "Alto Biobío", short_name: "Alto Biobío", region: Biobio)
Commune.create(full_name: "Chillán", short_name: "Chillán", region: Biobio)
Commune.create(full_name: "Bulnes", short_name: "Bulnes", region: Biobio)
Commune.create(full_name: "Cobquecura", short_name: "Cobquecura", region: Biobio)
Commune.create(full_name: "Coelemu", short_name: "Coelemu", region: Biobio)
Commune.create(full_name: "Coihueco", short_name: "Coihueco", region: Biobio)
Commune.create(full_name: "Chillán Viejo", short_name: "Chillán Viejo", region: Biobio)
Commune.create(full_name: "El Carmen", short_name: "El Carmen", region: Biobio)
Commune.create(full_name: "Ninhue", short_name: "Ninhue", region: Biobio)
Commune.create(full_name: "Ñiquén", short_name: "Ñiquén", region: Biobio)
Commune.create(full_name: "Pemuco", short_name: "Pemuco", region: Biobio)
Commune.create(full_name: "Pinto", short_name: "Pinto", region: Biobio)
Commune.create(full_name: "Portezuelo", short_name: "Portezuelo", region: Biobio)
Commune.create(full_name: "Quillón", short_name: "Quillón", region: Biobio)
Commune.create(full_name: "Quirihue", short_name: "Quirihue", region: Biobio)
Commune.create(full_name: "Ránquil", short_name: "Ránquil", region: Biobio)
Commune.create(full_name: "San Carlos", short_name: "San Carlos", region: Biobio)
Commune.create(full_name: "San Fabián", short_name: "San Fabián", region: Biobio)
Commune.create(full_name: "San Ignacio", short_name: "San Ignacio", region: Biobio)
Commune.create(full_name: "San Nicolás", short_name: "San Nicolás", region: Biobio)
Commune.create(full_name: "Treguaco", short_name: "Treguaco", region: Biobio)
Commune.create(full_name: "Yungay", short_name: "Yungay", region: Biobio)

Araucania = Region.create(short_name: "Araucanía", full_name: "Araucanía")
Commune.create(full_name: "Temuco", short_name: "Temuco", region: Araucania)
Commune.create(full_name: "Carahue", short_name: "Carahue", region: Araucania)
Commune.create(full_name: "Cunco", short_name: "Cunco", region: Araucania)
Commune.create(full_name: "Curarrehue", short_name: "Curarrehue", region: Araucania)
Commune.create(full_name: "Freire", short_name: "Freire", region: Araucania)
Commune.create(full_name: "Galvarino", short_name: "Galvarino", region: Araucania)
Commune.create(full_name: "Gorbea", short_name: "Gorbea", region: Araucania)
Commune.create(full_name: "Lautaro", short_name: "Lautaro", region: Araucania)
Commune.create(full_name: "Loncoche", short_name: "Loncoche", region: Araucania)
Commune.create(full_name: "Melipeuco", short_name: "Melipeuco", region: Araucania)
Commune.create(full_name: "Nueva Imperial", short_name: "Nueva Imperial", region: Araucania)
Commune.create(full_name: "Padre las Casas", short_name: "Padre las Casas", region: Araucania)
Commune.create(full_name: "Perquenco", short_name: "Perquenco", region: Araucania)
Commune.create(full_name: "Pitrufquén", short_name: "Pitrufquén", region: Araucania)
Commune.create(full_name: "Pucón", short_name: "Pucón", region: Araucania)
Commune.create(full_name: "Saavedra", short_name: "Saavedra", region: Araucania)
Commune.create(full_name: "Teodoro Schmidt", short_name: "Teodoro Schmidt", region: Araucania)
Commune.create(full_name: "Toltén", short_name: "Toltén", region: Araucania)
Commune.create(full_name: "Vilcún", short_name: "Vilcún", region: Araucania)
Commune.create(full_name: "Villarrica", short_name: "Villarrica", region: Araucania)
Commune.create(full_name: "Cholchol", short_name: "Cholchol", region: Araucania)
Commune.create(full_name: "Angol", short_name: "Angol", region: Araucania)
Commune.create(full_name: "Collipulli", short_name: "Collipulli", region: Araucania)
Commune.create(full_name: "Curacautín", short_name: "Curacautín", region: Araucania)
Commune.create(full_name: "Ercilla", short_name: "Ercilla", region: Araucania)
Commune.create(full_name: "Lonquimay", short_name: "Lonquimay", region: Araucania)
Commune.create(full_name: "Los Sauces", short_name: "Los Sauces", region: Araucania)
Commune.create(full_name: "Lumaco", short_name: "Lumaco", region: Araucania)
Commune.create(full_name: "Purén", short_name: "Purén", region: Araucania)
Commune.create(full_name: "Renaico", short_name: "Renaico", region: Araucania)
Commune.create(full_name: "Traiguén", short_name: "Traiguén", region: Araucania)
Commune.create(full_name: "Victoria", short_name: "Victoria", region: Araucania)

Rios = Region.create(short_name: "Los Ríos", full_name: "Los Ríos")
Commune.create(full_name: "Valdivia", short_name: "Valdivia", region: Rios)
Commune.create(full_name: "Corral", short_name: "Corral", region: Rios)
Commune.create(full_name: "Lanco", short_name: "Lanco", region: Rios)
Commune.create(full_name: "Los Lagos", short_name: "Los Lagos", region: Rios)
Commune.create(full_name: "Máfil", short_name: "Máfil", region: Rios)
Commune.create(full_name: "Mariquina", short_name: "Mariquina", region: Rios)
Commune.create(full_name: "Paillaco", short_name: "Paillaco", region: Rios)
Commune.create(full_name: "Panguipulli", short_name: "Panguipulli", region: Rios)
Commune.create(full_name: "La Unión", short_name: "La Unión", region: Rios)
Commune.create(full_name: "Futrono", short_name: "Futrono", region: Rios)
Commune.create(full_name: "Lago Ranco", short_name: "Lago Ranco", region: Rios)
Commune.create(full_name: "Río Bueno", short_name: "Río Bueno", region: Rios)

Lagos = Region.create(short_name: "Los Lagos", full_name: "Los Lagos")
Commune.create(full_name: "Puerto Montt", short_name: "Puerto Montt", region: Lagos)
Commune.create(full_name: "Calbuco", short_name: "Calbuco", region: Lagos)
Commune.create(full_name: "Cochamó", short_name: "Cochamó", region: Lagos)
Commune.create(full_name: "Fresia", short_name: "Fresia", region: Lagos)
Commune.create(full_name: "Frutillar", short_name: "Frutillar", region: Lagos)
Commune.create(full_name: "Los Muermos", short_name: "Los Muermos", region: Lagos)
Commune.create(full_name: "Llanquihue", short_name: "Llanquihue", region: Lagos)
Commune.create(full_name: "Maullín", short_name: "Maullín", region: Lagos)
Commune.create(full_name: "Puerto Varas", short_name: "Puerto Varas", region: Lagos)
Commune.create(full_name: "Castro", short_name: "Castro", region: Lagos)
Commune.create(full_name: "Ancud", short_name: "Ancud", region: Lagos)
Commune.create(full_name: "Chonchi", short_name: "Chonchi", region: Lagos)
Commune.create(full_name: "Curaco de Vélez", short_name: "Curaco de Vélez", region: Lagos)
Commune.create(full_name: "Dalcahue", short_name: "Dalcahue", region: Lagos)
Commune.create(full_name: "Puqueldón", short_name: "Puqueldón", region: Lagos)
Commune.create(full_name: "Queilén", short_name: "Queilén", region: Lagos)
Commune.create(full_name: "Quellón", short_name: "Quellón", region: Lagos)
Commune.create(full_name: "Quemchi", short_name: "Quemchi", region: Lagos)
Commune.create(full_name: "Quinchao", short_name: "Quinchao", region: Lagos)
Commune.create(full_name: "Osorno", short_name: "Osorno", region: Lagos)
Commune.create(full_name: "Puerto Octay", short_name: "Puerto Octay", region: Lagos)
Commune.create(full_name: "Purranque", short_name: "Purranque", region: Lagos)
Commune.create(full_name: "Puyehue", short_name: "Puyehue", region: Lagos)
Commune.create(full_name: "Río Negro", short_name: "Río Negro", region: Lagos)
Commune.create(full_name: "San Juan de la Costa", short_name: "San Juan de la Costa", region: Lagos)
Commune.create(full_name: "San Pablo", short_name: "San Pablo", region: Lagos)
Commune.create(full_name: "Chaitén", short_name: "Chaitén", region: Lagos)
Commune.create(full_name: "Futaleufú", short_name: "Futaleufú", region: Lagos)
Commune.create(full_name: "Hualaihué", short_name: "Hualaihué", region: Lagos)
Commune.create(full_name: "Palena", short_name: "Palena", region: Lagos)

Aisen = Region.create(short_name: "Aisén del Gral. Carlos Ibáñez del Campo", full_name: "Aisén del Gral. Carlos Ibáñez del Campo")
Commune.create(full_name: "Coihaique", short_name: "Coihaique", region: Aisen)
Commune.create(full_name: "Lago Verde", short_name: "Lago Verde", region: Aisen)
Commune.create(full_name: "Aisén", short_name: "Aisén", region: Aisen)
Commune.create(full_name: "Cisnes", short_name: "Cisnes", region: Aisen)
Commune.create(full_name: "Guaitecas", short_name: "Guaitecas", region: Aisen)
Commune.create(full_name: "Cochrane", short_name: "Cochrane", region: Aisen)
Commune.create(full_name: "O’Higgins", short_name: "O’Higgins", region: Aisen)
Commune.create(full_name: "Tortel", short_name: "Tortel", region: Aisen)
Commune.create(full_name: "Chile Chico", short_name: "Chile Chico", region: Aisen)
Commune.create(full_name: "Río Ibáñez", short_name: "Río Ibáñez", region: Aisen)

Magallanes = Region.create(short_name: "Magallanes y de la Antártica Chilena", full_name: "Magallanes y de la Antártica Chilena")
Commune.create(full_name: "Punta Arenas", short_name: "Punta Arenas", region: Magallanes)
Commune.create(full_name: "Laguna Blanca", short_name: "Laguna Blanca", region: Magallanes)
Commune.create(full_name: "Río Verde", short_name: "Río Verde", region: Magallanes)
Commune.create(full_name: "San Gregorio", short_name: "San Gregorio", region: Magallanes)
Commune.create(full_name: "Cabo de Hornos (Ex Navarino)", short_name: "Cabo de Hornos (Ex Navarino)", region: Magallanes)
Commune.create(full_name: "Antártica", short_name: "Antártica", region: Magallanes)
Commune.create(full_name: "Porvenir", short_name: "Porvenir", region: Magallanes)
Commune.create(full_name: "Primavera", short_name: "Primavera", region: Magallanes)
Commune.create(full_name: "Timaukel", short_name: "Timaukel", region: Magallanes)
Commune.create(full_name: "Natales", short_name: "Natales", region: Magallanes)
Commune.create(full_name: "Torres del Paine", short_name: "Torres del Paine", region: Magallanes)

Metropolitana = Region.create(short_name: "Metropolitana de Santiago", full_name: "Metropolitana de Santiago")
Commune.create(full_name: "Cerrillos", short_name: "Cerrillos", region: Metropolitana)
Commune.create(full_name: "Cerro Navia", short_name: "Cerro Navia", region: Metropolitana)
Commune.create(full_name: "Conchalí", short_name: "Conchalí", region: Metropolitana)
Commune.create(full_name: "El Bosque", short_name: "El Bosque", region: Metropolitana)
Commune.create(full_name: "Estación Central", short_name: "Estación Central", region: Metropolitana)
Commune.create(full_name: "Huechuraba", short_name: "Huechuraba", region: Metropolitana)
Commune.create(full_name: "Independencia", short_name: "Independencia", region: Metropolitana)
Commune.create(full_name: "La Cisterna", short_name: "La Cisterna", region: Metropolitana)
Commune.create(full_name: "La Florida", short_name: "La Florida", region: Metropolitana)
Commune.create(full_name: "La Granja", short_name: "La Granja", region: Metropolitana)
Commune.create(full_name: "La Pintana", short_name: "La Pintana", region: Metropolitana)
Commune.create(full_name: "La Reina", short_name: "La Reina", region: Metropolitana)
Commune.create(full_name: "Las Condes", short_name: "Las Condes", region: Metropolitana)
Commune.create(full_name: "Lo Barnechea", short_name: "Lo Barnechea", region: Metropolitana)
Commune.create(full_name: "Lo Espejo", short_name: "Lo Espejo", region: Metropolitana)
Commune.create(full_name: "Lo Prado", short_name: "Lo Prado", region: Metropolitana)
Commune.create(full_name: "Macul", short_name: "Macul", region: Metropolitana)
Commune.create(full_name: "Maipú", short_name: "Maipú", region: Metropolitana)
Commune.create(full_name: "Ñuñoa", short_name: "Ñuñoa", region: Metropolitana)
Commune.create(full_name: "Pedro Aguirre Cerda", short_name: "Pedro Aguirre Cerda", region: Metropolitana)
Commune.create(full_name: "Peñalolén", short_name: "Peñalolén", region: Metropolitana)
Commune.create(full_name: "Providencia", short_name: "Providencia", region: Metropolitana)
Commune.create(full_name: "Pudahuel", short_name: "Pudahuel", region: Metropolitana)
Commune.create(full_name: "Quilicura", short_name: "Quilicura", region: Metropolitana)
Commune.create(full_name: "Quinta Normal", short_name: "Quinta Normal", region: Metropolitana)
Commune.create(full_name: "Recoleta", short_name: "Recoleta", region: Metropolitana)
Commune.create(full_name: "Renca", short_name: "Renca", region: Metropolitana)
Commune.create(full_name: "San Joaquín", short_name: "San Joaquín", region: Metropolitana)
Commune.create(full_name: "San Miguel", short_name: "San Miguel", region: Metropolitana)
Commune.create(full_name: "San Ramón", short_name: "San Ramón", region: Metropolitana)
Commune.create(full_name: "Vitacura", short_name: "Vitacura", region: Metropolitana)
Commune.create(full_name: "Puente Alto", short_name: "Puente Alto", region: Metropolitana)
Commune.create(full_name: "Pirque", short_name: "Pirque", region: Metropolitana)
Commune.create(full_name: "San José de Maipo", short_name: "San José de Maipo", region: Metropolitana)
Commune.create(full_name: "Colina", short_name: "Colina", region: Metropolitana)
Commune.create(full_name: "Lampa", short_name: "Lampa", region: Metropolitana)
Commune.create(full_name: "Tiltil", short_name: "Tiltil", region: Metropolitana)
Commune.create(full_name: "San Bernardo", short_name: "San Bernardo", region: Metropolitana)
Commune.create(full_name: "Buin", short_name: "Buin", region: Metropolitana)
Commune.create(full_name: "Calera de Tango", short_name: "Calera de Tango", region: Metropolitana)
Commune.create(full_name: "Paine", short_name: "Paine", region: Metropolitana)
Commune.create(full_name: "Melipilla", short_name: "Melipilla", region: Metropolitana)
Commune.create(full_name: "Alhué", short_name: "Alhué", region: Metropolitana)
Commune.create(full_name: "Curacaví", short_name: "Curacaví", region: Metropolitana)
Commune.create(full_name: "María Pinto", short_name: "María Pinto", region: Metropolitana)
Commune.create(full_name: "San Pedro", short_name: "San Pedro", region: Metropolitana)
Commune.create(full_name: "Talagante", short_name: "Talagante", region: Metropolitana)
Commune.create(full_name: "El Monte", short_name: "El Monte", region: Metropolitana)
Commune.create(full_name: "Isla de Maipo", short_name: "Isla de Maipo", region: Metropolitana)
Commune.create(full_name: "Padre Hurtado", short_name: "Padre Hurtado", region: Metropolitana)
Commune.create(full_name: "Peñaflor", short_name: "Peñaflor", region: Metropolitana)

if Rails.env == 'development'
  puts '[ PREPARING DEVELOPMENT ENVIRONMENT ]'
  10.times do |i|
    user = User.new
    user.email = Faker::Internet.email
    user.password = '123456'
    user.password_confirmation = '123456'
    user.first_name = Faker::Name.first_name
    user.middle_name = Faker::Name.middle_name
    user.first_surname = Faker::Name.last_name
    user.second_surname = Faker::Name.last_name
    user.gender = User.genders.keys.sample
    user.bio = Faker::Hipster.paragraph
    puts "[#{(i + 1)}/10] User generated: #{user.email}"
    # Define if the created user has hostels by a random boolean value.
    while [true, false].sample
      puts '- Adding a Hostel for this user...'
      puts '- Downloading image from https://loremflickr.com/1280/960/house'
      file = open('https://loremflickr.com/1280/960/house')
      puts '- DONE! Image downloaded'
      hostel = Hostel.new
      hostel.name = Faker::FunnyName.name
      hostel.address = Faker::Address.street_address
      hostel.description = Faker::Hipster.paragraph
      hostel.commune = Commune.all.sample
      hostel.save
      hostel.principal_image.attach(
        io: file,
        filename: "hostel_principal_image_#{hostel.id}.jpg",
        content_type: 'image/jpg'
      )
      puts "- Hostel generated"
      registration = HostelRegistration.new
      registration.user = user
      registration.hostel = hostel
      registration.save
      registration.admin!
      puts "- Hostel registred by '#{user.email}'"
      loop do
        puts "- Adding features..."
        puts '- Downloading image from https://loremflickr.com/1024/300/panorama'
        file = open('https://loremflickr.com/1024/300/panorama')
        puts '- DONE! Image downloaded'
        hostel_feature = HostelFeature.new
        hostel_feature.hostel = hostel
        hostel_feature.title = Faker::FunnyName.name
        hostel_feature.description = Faker::Hipster.paragraph
        hostel_feature.save
        hostel_feature.image.attach(
          io: file,
          filename: "hostel_feature_image_#{hostel_feature.id}.jpg",
          content_type: 'image/jpg'
        )
        puts 'Hostel feature ADDED!'
        break if [true, false].sample
      end
      loop do
        puts "- Adding room types..."
        puts '- Downloading image from https://loremflickr.com/800/600/bed'
        file = open('https://loremflickr.com/800/600/bed')
        puts '- DONE! Image downloaded'
        room_type = RoomType.new
        room_type.hostel = hostel
        room_type.name = Faker::FunnyName.name
        room_type.description = Faker::Hipster.paragraph
        room_type.number_rooms = rand(20)
        room_type.occupied_rooms = rand(room_type.number_rooms)
        room_type.value_per_night = rand(400000)
        room_type.save
        room_type.image.attach(
          io: file,
          filename: "room_type_image_#{room_type.id}.jpg",
          content_type: 'image/jpg'
        )
        puts 'Room type ADDED!'
        break if [true, false].sample
      end
    end
  end
  puts '###############################'
  puts 'Seed generation finished:'
  puts "Admin email: #{admin.email}"
  puts "Admin password: #{admin.password}"
  puts ''
end
