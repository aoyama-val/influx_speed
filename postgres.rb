require "bundler/setup"
require "pg"

counter = 0
t = Thread.new {
  loop do
    sleep 1
    puts counter
  end
}

db = PG::connect(:host => "localhost", :user => "postgres", :dbname => "postgres")
begin
#  rows = db.exec("SELECT value FROM foobar")
#
#  # 各行を処理する
#  rows.each_with_index do |row, i|
#    puts "#{i} #{row["value"]}"
#  end

  loop do
    db.exec_params("INSERT INTO foobar (time, value) VALUES ($1, $2)", [Time.now, rand])
    counter += 1
  end

ensure
  # データベースへのコネクションを切断する
  db.finish
end
