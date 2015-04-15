require 'bacon'

require_relative '../lib/iostrust/certificate'
require_relative '../lib/iostrust/simulator'
require_relative '../lib/iostrust'

describe 'Certificate loading' do
  before do
    @cert_file_path = File.join(File.dirname(__FILE__), 'cert.crt')
  end
  it 'should load the certificate' do
    cert_file = File.join(File.dirname(__FILE__), 'cert.crt')
    @cert =  Iostrust::Certificate.new(@cert_file_path)
    @cert.should.not.be.nil
  end

  it 'should add cert to database' do
      Iostrust.simulators_paths.each do |sim_path|
        sim = Iostrust::Simulator.new(sim_path)
        sim.restore
        sim.add_cert(@cert)
      end
  end
end