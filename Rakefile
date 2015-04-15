require "bundler/gem_tasks"

namespace :spec do
	desc 'All specs'
	task :all do
		sh "bundle exec bacon #{FileList['spec/*.rb'].join(' ')}"
	end
end

