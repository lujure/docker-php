Vagrant.configure("2") do |config|
  config.vm.define "php" do |app|
    app.vm.provider "docker" do |d|
      d.build_dir = "."
      d.remains_running = false
    end
  end
end
