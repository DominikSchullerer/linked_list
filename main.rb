# frozen_string_literal: true

require_relative './lib/linked_list'

test_linked_list = LinkedList.new

test_linked_list.prepend(4)
test_linked_list.append(5)
test_linked_list.append(6)
test_linked_list.append(7)
test_linked_list.append(8)
test_linked_list.prepend(3)

puts test_linked_list
puts test_linked_list.size

puts test_linked_list.head
puts test_linked_list.tail

puts test_linked_list.at(2).to_s
puts test_linked_list.at(5).to_s
puts test_linked_list.at(6).to_s

puts test_linked_list.pop

puts test_linked_list
puts test_linked_list.size

puts test_linked_list.find(10)
puts test_linked_list.find(5).to_s

puts test_linked_list.contains?(10)
puts test_linked_list.contains?(5)

puts test_linked_list.insert_at(4.5, 2).to_s
puts test_linked_list.insert_at(8, 6)
puts test_linked_list.insert_at(10, 8)
puts test_linked_list

puts test_linked_list.remove_at(15)
puts test_linked_list.remove_at(2).to_s

puts test_linked_list
