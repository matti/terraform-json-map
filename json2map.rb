require 'json'
params = JSON.parse(STDIN.read)
object = JSON.parse(params["json"])

result = {}

unless object.is_a? Hash
  raise "json encodes #{object.class.name}, not Hash"
end

object.each_pair do |key, value|
  result[key] = value.to_json
end

puts result.to_json
