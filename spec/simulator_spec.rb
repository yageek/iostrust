require 'bacon'
require_relative '../lib/iostrust'

describe 'Simulator discovery' do

	it 'should discovers XCode simulators' do
		Iostrust.simulators_paths.size.should.be > 1
	end
end
