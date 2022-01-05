require 'json'

class FileManager
  def initialize
    @paths = {
      people: './people.json',
      books: './books.json',
      rentals: './rentals.json'
    }
  end

  def data_loader(file_name)
    if (File.exists?(file_name))
      file = File.open(file_name, "r")
      file_data = file.read
      file.close
      return JSON.parse(file_data, {symbolize_names: true})
    else
      save_file(file_name, [])
      return []
    end
  end

  def save_file(file_name, data)
    File.open(file_name, "w") { |file| file.write(data.to_json) }
  end

  def load_all_data
    output = {}
    for key, value in @paths
      output[key] = data_loader(value)
    end
    return output
  end

  def save_all_data(data)
    for key, value in data
      save_file(@paths[key], object_to_json(value))
    end
  end

  def object_to_json(object)
    variables = object.instance_variables
    output = {}
    for variable in variables
      output[variable.to_s.sub!("@","")] = object.instance_variable_get(variable)
    end
  end

end