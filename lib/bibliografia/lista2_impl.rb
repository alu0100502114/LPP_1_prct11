# encoding: utf-8
#

# Gestionar una Lista doblemente enlazada
class List2 < List


  # Inserta un nodo al principio de la lista
  def ins_start(value)
    if @head != nil && @head.next != nil
      n = @head
      @head = Node.new(value, n, nil)
      n.prev = @head
    elsif @head != nil
      n = @head
      @head = Node.new(value, n, nil)
      n.prev = @head
      @tail = n
    else
      @head = Node.new(value, nil, nil)
      @tail = @head
    end
  end
 
  # Insertar un nodo al final de la lista
  def ins_end(value)
    if @tail != nil
      @tail = Node.new(value, nil, @tail)
      n = @tail.prev
      n.next = @tail
    else
      @head = Node.new(value, nil, nil)
      @tail = @head
    end
  end
  
  # Extrae primer elemento
  def extract_first
    e = @head
    @head = e.next
    e
  end  
end