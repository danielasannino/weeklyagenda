namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    items = Item.where("created_at <= ?", Time.now - 7.days)

    puts "Deleting the following tasks:\n\n"
    items.each { |item|
      puts "id: #{item.id}\nname: #{item.name}\ncreated_at: #{item.created_at}\nuser: #{item.user.email}\n\n"
    }
    items.destroy_all
  end
end
