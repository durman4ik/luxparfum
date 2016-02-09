class DefaultConstraints
  def initialize
    @ips = %w('api', 'admin')
  end

  def matches?(req)
    binding.pry
    @ips.include?(req)
  end
end