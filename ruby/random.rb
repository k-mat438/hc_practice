# frozen_string_literal: true

rand_num = rand(2)
group = %w[A B C D E F]
ans_groups = [[], []]

if rand_num.zero?
  3.times do
    x = group.sample
    group.delete(x)
    ans_groups[0].push(x)
  end

  3.times do
    x = group.sample
    group.delete(x)
    ans_groups[1].push(x)
  end
else
  2.times do
    x = group.sample
    group.delete(x)
    ans_groups[0].push(x)
  end

  4.times do
    x = group.sample
    group.delete(x)
    ans_groups[1].push(x)
  end
end

p ans_groups[0].sort
p ans_groups[1].sort
