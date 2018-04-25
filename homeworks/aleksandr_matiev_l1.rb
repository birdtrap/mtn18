#!/usr/bin/env ruby
require 'time'
=begin
str11 = %Q(10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
)
str22 = %Q(2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
2018-04-23 17:19:0.0 ubuntu-xenial[14319] Debug - Calling core with action: aaaaaa)
str33 = %Q(jks3.14gdfg456)
=end
#FIRST TASK
def task_1(input)
  result = ""
  input.each_line do |x|  
  if x.downcase.include?("error")
    result << x[0 ..-2]
    end
  end
  result
end

def task_2(input)
  result = []
  input.each_line do |x|  
    if (x.match(/(?:\d{1,3}\.){3}\d{1,3} - - \[(.*?)\] "POST \/.* HTTP\/.*/))
      unless x.downcase.include?("error")
      result << x[/\[(.*?)\]/][1...-1] + " FROM: " + x[/(?:\d{1,3}\.){3}\d{1,3}/] + " TO: " + x.split(/\s/)[6].upcase
      end
    end
  end
  result
end

#SECOND TASK
def task_3(input)
  result = []
  str_arr = input.split("\n")
  str_arr.each_index do |n|  
    if str_arr[n].include?("Calling core with action")
      str_cut = str_arr[n+1, str_arr.length]
      str_cut.each_index do |nn| 
        if str_cut[nn].include?("Calling core with action")
          result <<  (Time.parse(str_cut[nn][0..20]) - Time.parse(str_arr[n][0..20]))
          break
        end
      end
    end
  end
  result.first
end

#THIRD TASK
def task_4(input)
 sum = 0
   input.each_char {|n| sum += n.to_i}
     sum
end

#puts task_2(str11)
#puts task3(str33)

