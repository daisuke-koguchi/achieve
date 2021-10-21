require 'pg'
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  result_false = connection.exec("select weight,give_for from crops where quality = 'false'; ")
  result_false.each do |record|
    puts "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]}"
  end
ensure 
  connection.finish
end
