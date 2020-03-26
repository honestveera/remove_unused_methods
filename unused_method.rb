class UnusedMethod

def initialize(file_path)
 @file_path = file_path
 @file_name, @method_name = file_name_and_method_name(file_path)
end

def file_name_and_method_name(file_path)
 file_name, method_name = file_path.split('-')
 [file_name.split(':').first.to_s.strip, method_name.split('#').last.gsub(')','').to_s.strip]
end

def get_start_end_offsets
  indent = -1
  lines = File.open(@file_name,'r').each_with_index.select do |line, i|
    cond1 = line.lstrip.start_with?("def #{@method_name}") || line.lstrip.start_with?("def self.#{@method_name}")
    indent = line.size - line.lstrip.size if cond1
    cond2 = line.strip == "end" && line.size - line.lstrip.size == indent
    cond1 .. cond2 ? true : false
  end
  return nil if lines.nil?
  lines.map(&:last).minmax
end

def delete_unuse_methods
 start_no, end_no = get_start_end_offsets
 file_name = @file_name
 File.open(file_name, 'r+') do |file|
  lines_arr = File.readlines(file_name)
  skip_line = lines_arr[start_no.to_i .. end_no.to_i]	
  modified_part = skip_line.map {|l| "# #{l}"}.join
  p skip_line.join
  p modified_part
  line_read = File.read(file_name).sub(skip_line.join, modified_part)
  file.puts(line_read)
 end
end

end
