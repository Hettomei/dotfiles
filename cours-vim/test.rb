
require 'benchmark'
iteration = 1000
Benchmark.bmbm do |performance|
  performance.report("old") do
    iteration.times do
        method1
    end
  end

  performance.report("new") do
    iteration.times do
      method2
    end
  end
end
