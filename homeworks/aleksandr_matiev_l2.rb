#!/usr/bin/env ruby
require 'time'
require 'yaml'
def task_2_2(st)
  h = YAML.safe_load(st)
  res = []
  res2 = {}
  return res if st == ''

  h.each do |key, value|
    res2 = {}
    pool = 1
    timeout = 1000
    res2[:db] = value['database']
    res2[:user] = value['username'] if value.key?('username')
    res2[:password] = value['password'] if value.key?('password')
    pool = value['pool'] if value.key?('pool')
    timeout = value['timeout'] if value.key?('timeout')
    res2[:magic_number] = pool * timeout
    # res[key] = res2
    res << Hash[key.to_sym, res2]
  end
  res
end

def task_2_1(n)
  fib = [0]
  a = 0
  b = 1
  i = 0

  if n < 0
    fib.shift
    return fib
  end

  while i < n
    fib.push(b)
    a, b = b, a + b
    i += 1
  end

  fib.shift if n > 0

  fib
end

def task_2_3(arr)
  arr.flatten.uniq.sort.reverse
end

def task_2_4(str)
  str.downcase.match? str.downcase.reverse
end

# p task_2_1(-1)
# p task_2_2(str)
# p task_2_3([1, 5, 9, 1, [2, 8, 6]])
# p task_2_4('asdgdfgdfSa')
