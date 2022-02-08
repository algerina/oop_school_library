class Corrector
  def correct_name(name)
    name.capitalize!
    name.compact if name.length > 10
  end
end
