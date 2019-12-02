require "csv"

CSV.open('data.csv','w') do |output_csv|
  File.open( "db/schema.rb" ).each do |line|
    # テーブル名
    if line.include?("create_table")
      table_name = line.split(",")[0].split(" ")[1].delete("\"")
      output_csv << ["table: #{table_name}"]
    # インデックスは出力しない
    elsif line.include?("t.index")
    # カラム
    elsif line.include?("t.")
      column_type = line.split(",")[0].split(" ")[0].delete("\"").gsub(/t\./, "")
      column_name = line.split(",")[0].split(" ")[1].delete("\"")
      comment = line.split(",").select {|array| array.include?("comment") }
      comment = comment[0].split(" ")[1].delete("\"") if comment.present?
      comment = "created at" if column_name == "created_at"
      comment = "updated at" if column_name == "updated_at"
      output_line = []
      if comment.present?
        output_line = ["#{column_type}","#{column_name}","#{comment}"]
      else
        output_line = ["#{column_type}","#{column_name}"]
      end
      output_csv << output_line
    else
      output_csv << []
    end
  end
end

