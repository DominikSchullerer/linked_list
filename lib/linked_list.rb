# frozen_string_literal: true

require_relative './node'

# Linked list
class LinkedList
  def initialize
    @entry = Node.new
  end

  def append(value)
    current_pos = @entry
    current_pos = current_pos.next_node until current_pos.next_node.nil?
    current_pos.next_node = Node.new(value, nil)
  end

  def to_s
    string = ''

    current_pos = @entry.next_node
    until current_pos.next_node.nil?
      string += "#{current_pos.value} -> "
      current_pos = current_pos.next_node
    end

    string += "#{current_pos.value} -> nil"

    string
  end

  def prepend(value)
    new_node = Node.new(value, @entry.next_node)
    @entry.next_node = new_node
    new_node
  end

  def size
    size = 0

    current_pos = @entry
    until current_pos.next_node.nil?
      size += 1
      current_pos = current_pos.next_node
    end

    size
  end

  def head
    @entry.next_node.to_s
  end

  def tail
    current_pos = @entry
    current_pos = current_pos.next_node until current_pos.next_node.nil?
    current_pos.to_s
  end

  def at(index)
    return nil if index > size - 1

    current_pos = @entry.next_node
    index.times { current_pos = current_pos.next_node }
    current_pos
  end

  def pop
    current_pos = @entry

    return nil if current_pos.next_node.nil?

    current_pos = current_pos.next_node until current_pos.next_node.next_node.nil?
    tmp = current_pos.next_node

    current_pos.next_node = nil

    tmp
  end

  def find(value)
    found_node = nil
    current_pos = @entry

    until found_node || current_pos.next_node.nil?
      found_node = current_pos if current_pos.value == value
      current_pos = current_pos.next_node
    end

    found_node
  end

  def contains?(value)
    if find(value).nil?
      false
    else
      true
    end
  end

  def insert_at(value, index)
    current_pos = @entry
    if index >= size
      current_pos = current_pos.next_node until current_pos.next_node.nil?

      (index - size).times do
        new_node = Node.new(nil, nil)
        current_pos.next_node = new_node
        current_pos = new_node
      end

      current_pos.next_node = Node.new(value, nil)
    else
      index.times { current_pos = current_pos.next_node }

      new_node = Node.new(value, current_pos.next_node)
      current_pos.next_node = new_node

      new_node
    end
  end

  def remove_at(index)
    return nil if index >= size

    current_pos = @entry
    index.times { current_pos = current_pos.next_node }

    tmp = current_pos.next_node
    current_pos.next_node = tmp.next_node

    tmp
  end
end
