class Class
  attr_accessor :instance_type

  attr_reader :instance_flags

  def self.allocate
    Ruby.primitive :class_s_allocate
    raise PrimitiveFailure, "Unable to create a new Class"
  end

  def set_superclass(sup)
    Ruby.primitive :class_set_superclass
    raise TypeError, "superclass must be a Class (#{Rubinius::Type.object_class(sup)} given)"
  end

  private :set_superclass

  def packed!(ary)
    Ruby.primitive :class_set_packed
    raise PrimitiveFailure, "Class#pack! failed"
  end
end
