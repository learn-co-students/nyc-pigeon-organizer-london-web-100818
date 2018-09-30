pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def nyc_pigeon_organizer(data)
  new_hash = get_new_hash(data)
  new_hash

end

def get_new_hash(data)
  new_hash = {}
  names = get_pigeon_names(data)
  new_hash = get_initial_hash(names)
  new_hash = populate_catagories(new_hash, data)
  data.keys.each do |key|
    new_hash = populate_pigeon_info(new_hash, data, key)
  end
  new_hash
end

def populate_pigeon_info(new_hash, data, info)
  data[info].each do |color, name_array|
    new_hash.each do |name, type|
      type.each do |catagory, array|
        if(name_array.include?(name))
          new_hash[name][info] << color.to_s
        end
      end
      new_hash[name][info].uniq!
    end
  end
  new_hash
end

def populate_catagories(new_hash, data)
  new_hash.each do |name, catagory|
    data.keys.each do |types|
      new_hash[name][types] = []
    end
  end
  new_hash
end

def get_initial_hash(name_array)
  new_hash = {}
  name_array.each do |name|
    new_hash[name] = {}
  end
  new_hash
end

def get_pigeon_names(data)
  name_array = []
  data.each do |catagory, hash|
    hash.each do |type, name|
      name.each do |value|
        name_array << value
      end
    end
  end
  name_array.uniq
end

nyc_pigeon_organizer(pigeon_data)
