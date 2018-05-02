#!/usr/bin/env ruby
require 'time'

# ##############TASK 3_1#######################
def task_3_1(my_proc)
  start_time = Time.now
  my_proc.call
  (Time.now - start_time).round(1)
end
# my_pr = proc { sleep 1 }
# task_3_1(my_pr)

# ar = [1, 2, 3, 4]
# ##############TASK 3_2#######################
def task_3_2(arr, a = 0)
  arr = arr.map { |i| yield(i) } if block_given?
  res = arr.sum + a
  res
end

# task_3_2(ar)
# task_3_2(ar, 10)
# task_3_2(ar) { |i| i ** 2}
# task_3_2(ar, 10) { |i| i ** 2}

# re = (100..160)
# ###############TASK 3_3#####################
def task_3_3(my_range)
  return 'aaaa' if my_range.last < 100 || my_range.first > 999
  i = my_range.first < 100 ? 100 : my_range.first
  i += 1 while i % 7 != 3
  i
end

# task_3_3(re)

# ###############TASK 3_4#####################
def task_3_4(_a, _b, *args)
  if block_given?
    args.each { |i| yield(i) }
  else
    p 'ERROR'
  end
end

# task_3_4(1, 2, 10, 20, 30)
# task_3_4(1, 2, 10, 20, 30) {|i| puts i }

# ##############TASK 3_5#######################
def task_3_5(arr)
  res = []
  if block_given?
    arr.each { |i| res << i if i.even? && yield(i) }
  else
    res
  end
  res
end

def task_3_6(str)
  res = []
  block_given? ? str.each_line { |i| res << yield(i) } : (return str)
  res
end

# task_3_6("hello\nworld")
# task_3_6("hello\nworld") { |line| line.include? 'e' }
# task_3_6("hello\nworld") { |line| line.include? 'xxx' }
# task_3_6("hello\nmy\ncruel\nworld") { |line| line[1] }
