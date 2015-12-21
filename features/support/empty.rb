# I don't know why ActiveSupport methods aren't available inside the
# Cukes, but here's this in any case.

class NilClass
  def empty?; true; end
end