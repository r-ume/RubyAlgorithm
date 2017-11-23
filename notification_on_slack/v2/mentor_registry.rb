require 'yaml'
require 'pry'
require 'singleton'

# List of Mentors
class MentorRegistry
  include Singleton
  MENTOR_CONFIG_FILENAME = 'mentors.yml'

  def initialize
    @settings = YAML.load_file(MENTOR_CONFIG_FILENAME)
  end

  def find_by_name(name)
    @settings[name]
  end

end
