# Ruby 3.2+ removed Object#tainted? and Object#untaint.
# Liquid 4.0.x (required by Jekyll 4.x) calls these internally.
# This plugin restores no-op versions for compatibility.
class Object
  def tainted?
    false
  end unless method_defined?(:tainted?)

  def untaint
    self
  end unless method_defined?(:untaint)
end
