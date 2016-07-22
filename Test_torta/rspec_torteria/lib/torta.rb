class Torta
  attr_reader :type

  def initialize(type)
    @type = type
     @time_baked = 0
  end

  def bake!(time)
     @time_baked += time
     self
  end

  def status
     status = @time_baked.to_f / bake_time

     case
     when status < 0.5
      'crudo'
    when status < 0.7
      'casi listo'
    when status <= 1.0
      'listo'
    when status > 1.0
      'quemado'
    end
  end

  def bake_time
     { "jamon" => 3, "queso" => 8, "milanesa" => 10 }[@type]
  end
end

  torta = Torta.new("jamon")
   p torta.bake!(3)
   p torta.status 
  # p torta.bake!(-3)
  # p torta.status 
  # p torta.bake!(0.10)
  # p torta.status 
  # p torta.bake!(-1)
  # p torta.status 
 p torta.bake_time
# # p "**************"
# # torta = Torta.new("queso")
# # p torta.bake!(8)
# # p torta.status == "listo"
# # p torta.status 
# # p torta.bake_time
# p "**************"
# torta = Torta.new("milanesa")
# p torta.bake!(4)
# p torta.status == "listo"
# p torta.status 
# p torta.bake_time
