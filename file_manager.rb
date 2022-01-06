require 'json'

class FileManager
  def initialize
    @ignored_keys = ['corrector']
    @paths = {
      people: './people.json',
      books: './books.json',
      rentals: './rentals.json'
    }
  end

  def data_loader(file_name)
    if File.exist?(file_name)
      file = File.open(file_name, 'r')
      file_data = file.read
      file.close
      JSON.parse(file_data, { symbolize_names: true })
    else
      save_file(file_name, [])
      []
    end
  end

  def save_file(file_name, data)
    file = File.open(file_name, 'w')
    file.write(data.to_json)
    file.close
  end

  def load_all_data
    output = {}
    @paths.each do |key, value|
      output[key] = data_loader(value)
    end
    output
  end

  def save_all_data(data)
    data.each do |key, value|
      save_file(@paths[key], get_objects_from_array(value))
    end
  end

  def get_objects_from_array(array)
    array.each_with_index do |item, index|
      array[index] = object_to_json(item)
    end
    array
  end

  def object_to_json(item)
    variables = item.instance_variables
    output = {}
    output['identifier'] = item.class.to_s
    variables.each do |variable|
      unless @ignored_keys.include?(variable.to_s.delete('@'))
        output[variable.to_s.sub!('@', '')] = item.instance_variable_get(variable.to_s)
      end
      if variable.to_s == '@book' || variable.to_s == '@person'
        output[variable.to_s.sub!('@', '')] = object_to_json(item.instance_variable_get(variable.to_s))
      end
    end
    output
  end
end
