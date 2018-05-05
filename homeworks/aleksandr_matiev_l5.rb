# Script
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
