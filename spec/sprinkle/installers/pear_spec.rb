require File.expand_path("../../spec_helper", File.dirname(__FILE__))

describe Sprinkle::Installers::Pear do

  before do
    @package = mock(Sprinkle::Package, :name => 'spec')
  end

  def create_pear(names, options = {}, &block)
    Sprinkle::Installers::Pear.new(@package, names, options, &block)
  end

  describe 'during installation' do

    it 'should invoke the pear executer for all specified tasks' do
      @installer = create_pear 'spec'
      @install_commands = @installer.send :install_commands
      @install_commands.should == "pear install --alldeps spec"
    end
  end
end
