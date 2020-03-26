class CommentUnusedMethod

  def comment(file_name)
    count = 0
    File.readlines(file_name).each do |line|
      count += 1
      c = UnusedMethod.new(line)
      c.delete_unuse_methods
    end
    puts "Total Count: #{count}"
  end

end
