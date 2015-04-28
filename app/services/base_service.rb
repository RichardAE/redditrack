class BaseService
  def self.run(*params)
    command = self.new
    command.execute(*params)
  end
end
