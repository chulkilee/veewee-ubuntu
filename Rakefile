BASEBOX_NAME = ENV['BASEBOX_NAME'] || 'ubuntu-12.04'
BOX_NAME = ENV['BOX_NAME'] || 'developer-ubuntu'

namespace :build do
  desc 'Delete existing basebox related files (.box, vagrant box, vbox)'
  task :clean => ['vagrant:basebox:remove', 'vbox_manage:basebox:delete'] do
    File.delete("#{BASEBOX_NAME}.box") if File.exists?("#{BASEBOX_NAME}.box")
  end

  desc 'Build basebox vbox'
  task :vbox do
    sh "bundle exec veewee vbox build '#{BASEBOX_NAME}'"
  end
end

namespace :vbox_manage do
  namespace :basebox do
    desc 'Delete vbox for basebox'
    task :delete do
      sh "VBoxManage unregistervm --delete '#{BASEBOX_NAME}'" if has_vm?(BASEBOX_NAME)
    end
  end

  desc 'Delete vbox for box'
  task :delete do
    sh "VBoxManage unregistervm --delete '#{BOX_NAME}'" if has_vm?(BOX_NAME)
  end

  def has_vm?(vm_name)
    `VBoxManage list vms`.split("\n").any?{|row| row =~ /\"#{vm_name}/ }
  end
end

namespace :vagrant do
  namespace :basebox do
    desc 'Export basebox to BASEBOX_NAME.box'
    task :export do
      sh "bundle exec vagrant basebox export '#{BASEBOX_NAME}'"
    end

    desc 'Remove vagrant basebox if exists'
    task :remove do
      sh "bundle exec vagrant box remove '#{BASEBOX_NAME}'" if has_box?(BASEBOX_NAME)
    end
  end

  desc 'Add vagrant box from basebox'
  task :add do
    sh "bundle exec vagrant box add '#{BOX_NAME}' '#{BASEBOX_NAME}.box'"
  end

  desc 'Repackage box'
  task :repackage do
    sh "bundle exec vagrant box repackage '#{BOX_NAME}'"
  end

  def has_box?(box_name)
    `bundle exec vagrant box list`.split("\n").include?(box_name)
  end
end

task :build => ['build:vbox', 'vagrant:basebox:export']
