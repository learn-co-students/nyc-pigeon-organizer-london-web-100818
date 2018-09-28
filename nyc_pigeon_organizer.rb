def nyc_pigeon_organizer(data)
  # write your code here!
  pigeon_list = {}

  data.each { |category, hash|
    hash.each { |detail, array|
      array.each { |name|
        pigeon_list[name] ||= {}
        pigeon_list[name][category] ||= []
        pigeon_list[name][category] << detail.to_s
      }
    }
  }

  return pigeon_list
end
