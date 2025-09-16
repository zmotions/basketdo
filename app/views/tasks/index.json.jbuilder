json.list do
  json.array! @tasks, partial: "tasks/task", as: :task
end

json.partial! "shared/pagination", pageable: @tasks