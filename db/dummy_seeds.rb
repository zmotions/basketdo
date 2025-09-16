run_dummy = ENV.fetch("DUMMY", "0").to_i == 1
should_clean = ENV.fetch("DUMMY_CLEAN", "0").to_i == 1
should_seed = ENV.fetch("DUMMY_CREATE", "0").to_i == 1
should_measure = ENV.fetch("DUMMY_PERF", "0").to_i == 1
should_all = ENV.fetch("DUMMY_ALL", "0").to_i == 1

return unless run_dummy

start = should_measure || should_all ? Process.clock_gettime(Process::CLOCK_MONOTONIC): 0.0

if should_clean || should_all
  Task.delete_all
  Category.delete_all
end

if should_seed || should_all

  categories = 10.times.map do
    Category.create({ name: Faker::Hobby.activity })
  end

  num_tasks = 10_000
  batch_size = 500
  batch = []

  num_tasks.times do
    batch << {
      name: "Task: #{Faker::Hobby.activity}",
      description: Faker::Quote.yoda,
      duration: rand(2..101),
      due_on: Faker::Time.forward,
      category_id: categories[rand(0..(categories.length-1))].id,
      created_at: Time.current,
      updated_at: Time.current
    }
    if batch.size >= batch_size
      Task.insert_all(batch)
      batch = []
    end
  end

  Task.insert_all(batch) unless batch.empty?
end

if should_measure || should_all
  diff = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start
  puts "Took #{diff} seconds"
end