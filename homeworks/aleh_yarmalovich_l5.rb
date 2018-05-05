# class SuperScript
class SuperScript < Script
  def self.run(name, _stdout_log = nil, _stderr_log = nil)
    super()
    res = yield
  rescue StandardError => error
    mes = "ERROR: #{Time.now} #{name[:name]} #{error}"
    file = name[:stderr_log]
  else
    mes = "#{Time.now} #{name[:name]} #{res}"
    file = name[:stdout_log]
  ensure
    if file.nil?
      puts mes
    else
      File.open(file, 'w') { |f| f.puts mes }
    end
  end
end

# another way
# class SuperScript < Script
#  def self.if_error(name, file, error)
#    if file.nil?
#      puts "ERROR: #{Time.now} #{name} #{error}"
#    else
#      File.open(file, 'w') { |f| f.puts "ERROR: #{Time.now} #{name} #{error}" }
#    end
#  end

#  def self.if_ok(name, file, res)
#    if file.nil?
#      puts "#{Time.now} #{name} #{res}"
#    else
#      File.open(file, 'w') { |f| f.puts "#{Time.now} #{name} #{res}" }
#    end
#  end

#  def self.run(name, _stdout_log = nil, _stderr_log = nil)
#    super()
#    res = yield
#  rescue StandardError => error
#    if_error(name[:name], name[:stderr_log], error)
#  else
#    if_ok(name[:name], name[:stdout_log], res)
#  end
# end
