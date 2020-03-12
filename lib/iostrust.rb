require "iostrust/version"
require "iostrust/simulator"
require "iostrust/certificate"

module Iostrust
  private
  SIMULATOR_HOME_LIBRARY_PATTERNS = [
      "Application Support/iPhone Simulator/3.*/Library/",
      "Application Support/iPhone Simulator/4.*/Library/",
      "Developer/CoreSimulator/Devices/**/data/Library/",
      "Developer/XCTestDevices/**/data/Library/",
      "Application Support/iPhone Simulator/User/Library/"
  ]

  def self.path_for_pattern(pattern)
    return File.join(Dir.home, 'Library', pattern)
  end

  public
  def self.simulators_paths
    simulators = []
    SIMULATOR_HOME_LIBRARY_PATTERNS.each do |pattern|
      found_paths = Dir.glob(path_for_pattern(pattern))
      simulators.push(*found_paths)
    end
    simulators
  end

end