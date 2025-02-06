namespace :csv do
  desc "Gera um arquivo CSV aleatório no diretório tmp"
  task generate: :environment do
    require 'csv'
    require 'securerandom'
    require 'faker'

    # Gera um nome aleatório para o arquivo
    filename = "tmp/import_#{SecureRandom.hex(8)}.csv"

    # Número de linhas no CSV (entre 5 e 15)
    total_rows = rand(30..100)

    # Gera e escreve os dados no CSV
    CSV.open(filename, "w", write_headers: true, headers: ["title", "description", "ends_at"]) do |csv|
      total_rows.times do
        csv << [
          Faker::Lorem.sentence(word_count: 3),  # Título aleatório
          Faker::Lorem.paragraph(sentence_count: 2),  # Descrição aleatória
          Faker::Time.forward(days: rand(1..30), period: :morning) # Data futura aleatória
        ]
      end
    end

    puts "Arquivo CSV gerado: #{filename}"
  end
end
