namespace :estados do
  
  desc "Popula todos os estados do Brasil"
  task :import => :environment do
    Estado.destroy_all
    caminho = "#{Rails.root}/db/seed_data/"

    File.open(caminho + 'estados.txt').each_with_index do |linha, index|
      pais, sigla, nome, ibge = linha.chomp.split("|")
      estado = Estado.new( :sigla => sigla, :nome => nome )
      puts "Importando Estado #{index} - #{nome}" if estado.save
    end
  end
  
end


namespace :cidades do
  
  desc "Popula todos as cidades do Brasil"
  task :import => :environment do
    Estado.destroy_all
    caminho = "#{Rails.root}/db/seed_data/"
    
    File.open(caminho + 'cidades.txt').each_with_index do |linha, index|
      ufd, ibge, nome = linha.chomp.split("|")
      cidade = Cidade.new( :nome => nome, :estado_id => ufd)
      puts "Importando Cidade #{index} - #{nome}" if cidade.save
      
    end
  end
  
end