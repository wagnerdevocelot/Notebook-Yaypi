namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    %x(rails db:drop db:create db:migrate)



    ###############################################

    puts "Cadastrando tipos..."

    kinds = %W(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos cadastrados com sucesso!"

    ###############################################

    puts "Cadastrando contatos..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts "Contatos cadastrados com sucesso!"

    ###############################################

    puts "cadastrando os Telefones"

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        Phone.create!(number:Faker::PhoneNumber.cell_phone, contact: contact)
      end
    end

    puts "Telefones cadastrados com sucesso!"

    ########################################################

    puts "cadastrando os Endereços"

    Contact.all.each do |contact|
      address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereços cadastrados com sucesso!"


  end
end
