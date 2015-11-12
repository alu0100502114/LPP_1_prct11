# encoding: utf-8
#
# Nodo para Lista
# con "value" para valor del Nodo
#     "next" para puntero a siguiente nodo
#     "prev" para punteo a anterior nodo
Node = Struct.new(:value, :next) do
  
  # Mostrar por pantalla un nodo
  def to_s
    if @next == nil
      "#{value}" 
    else 
      "#{value} <->" 
    end
  end
  
end

# Gestionar una Lista enlazada
class List

  # head para cabecera
  # tail para cola
  attr_accessor :head, :tail

  # Constructor
  def initialize
    @head = nil
    @tail = nil
  end

  # Inserta un nodo al principio de la lista
  def ins_start(value)
    if @head != nil && @head.next != nil
      n = @head
      @head = Node.new(value, n)
    elsif @head != nil
      n = @head
      @head = Node.new(value, n)
      @tail = n
    else
      @head = Node.new(value, nil)
      @tail = @head
    end
  end

  # Insertar un nodo al final de la lista
  def ins_end(value)
    if @tail != nil
      n = Node.new(value, nil)
      @tail.next = n
      @tail = n
    else
      @head = Node.new(value, nil)
      @tail = @head
    end
  end

  # Número de nodos de una lista
  def length 
    if @head == nil
      num = 0
    else
      n = @head
      num = 1
      while n.next != nil
        num += 1
        n = n.next
      end
    end
    num
  end
  
end