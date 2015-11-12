# encoding: utf-8
#
# Nodo para Lista
# con "value" para valor del Nodo
#     "next" para puntero a siguiente nodo
#     "prev" para punteo a anterior nodo
Node = Struct.new(:value, :next, :prev) do
  
  # Mostrar por pantalla un nodo
  def to_s
    if @next == nil && @prev == nil
      "#{value}" 
    else 
      "#{value} <->" 
    end
  end
  
end

# Gestionar una Lista enlazada
class List
  include Enumerable
  
  # head para cabecera
  # tail para cola
  attr_accessor :head, :tail

  # Lee lista de nodos
  def each
    while @head != nil
      yield @head.value
      @head = @head.next
    end  
  end

  # Constructor
  def initialize
    @head = nil
    @tail = nil
  end

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

  # Eliminar un nodo del principio de la lista
  def del_start
    @head = @head.next
    if @head != nil
      @head.prev = nil
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
 
  # Eliminar un nodo del final de la lista
  def del_end
    @tail = @tail.prev
    if @tail != nil
      @tail.next = nil
    else
      @head = @tail
    end
  end

end