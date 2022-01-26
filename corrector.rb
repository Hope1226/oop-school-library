# Corrector class
class Corrector
  def correct_name(name)
    name.length <= 10 ? name.capitalize : name.slice(0..9).capitalize
  end
end
