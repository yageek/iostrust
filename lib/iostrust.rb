require "iostrust/version"
require "iostrust/simulator"

module Iostrust
  private
  TRUSTED_STORE_SQLITE = 'TrustStore.sqlite3'
  SIMULATOR_HOME_LIBRARY_PATTERNS = [
      "Application Support/iPhone Simulator/3.*/Library/Keychains/",
      "Application Support/iPhone Simulator/4.*/Library/Keychains/",
      "Developer/CoreSimulator/Devices/**/data/Library/Keychains/",
      "Application Support/iPhone Simulator/User/Library/Keychains/"
  ]

  def self.path_for_pattern(pattern)
    return File.join(Dir.home, 'Library', pattern, TRUSTED_STORE_SQLITE)
  end

  public
  def self.simulators
    simulators = []
    SIMULATOR_HOME_LIBRARY_PATTERNS.each do |pattern|
      found_paths = Dir.glob(path_for_pattern(pattern))
      simulators.push(*found_paths)
    end
    simulators
  end

end