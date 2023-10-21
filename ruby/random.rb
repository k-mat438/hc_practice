# frozen_string_literal: true

rand_num = rand(2)
group = %w[A B C D E F]
ans_groups = [[], []]

x = if rand_num.zero?
      group.sample(3)
    else
      group.sample(2)
    end
ans_groups[0].push(*x)
ans_groups[1].push(*group.difference(x))

p ans_groups[0].sort
p ans_groups[1].sort
