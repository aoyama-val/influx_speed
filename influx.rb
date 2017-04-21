require "bundler/setup"
require "influxdb"

influxdb = InfluxDB::Client.new "mydb", host: "localhost", time_precision: "u"

p influxdb.list_databases

name = "foobar"

counter = 0

t = Thread.new {
  loop do
    sleep 1
    puts counter
  end
}

loop do
  data = {
    values: { value: rand },
  }
  influxdb.write_point(name, data)
  counter += 1
end
