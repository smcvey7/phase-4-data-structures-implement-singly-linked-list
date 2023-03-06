require_relative './node'
require 'Pry'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(node)
    if head.nil?
      self.head = node
      return
    end

    last_node = head

    while last_node.next_node
      last_node = last_node.next_node
    end

    last_node.next_node = node
  end

  def prepend(node)
    if head.nil?
      self.head = node
      return
    else
      new_head = node
      new_head.next_node = head
      self.head = new_head
    end
  end

  def delete_head
    if head.nil?
      return
    end

    if head&.next_node
      puts "head&: #{head&.next_node}"
      self.head = self.head.next_node
      return
    elsif head && !head.next_node
      self.head = nil
    end
  end

  def delete_tail
    if head.nil?
      return
    end

    if !head.next_node
      @head = nil
    else
      first = head
      second = head.next_node

      while second.next_node
        first = second
        second = second.next_node
      end
      first.next_node = nil
    end

  end

  def add_after(index, node)
    following = head

    index.times do
      following = following.next_node unless following.next_node == nil
    end

    if following.next_node.nil?
      append(node)
      return
    end

    before = following
    this_node = node
    after = following.next_node

    before.next_node = this_node
    this_node.next_node = after
  end

  def search(value)
    check = head
    until check.data == value
      check = check.next_node
    end

    check

  end

end
