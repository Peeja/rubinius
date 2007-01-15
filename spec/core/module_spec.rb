require File.dirname(__FILE__) + '/../spec_helper'

context "Module" do
  specify "instance_methods with false should exclude super class instance methods" do
    example do
      class Foo
        def foo
        end
      end

      Foo.instance_methods(false)
    end.should == ["foo"]
  end
  
  specify "const_defined? should return false if the name is not defined" do
    example do
      Object.const_defined?("Whee")
    end.should == false
  end
  
  specify "const_defined? should return true if the name is defined" do
    example do
      class Blah
        class Whee
        end
      end

      [ Object.const_defined?(:Object),
        Blah.const_defined?("Whee"), 
        Object.const_defined?("Blah::Whee"),
        Object.const_defined?("Blah::Zargle") ]
    end.should == [true, true, true, false]
  end
end
