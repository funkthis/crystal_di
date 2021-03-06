require "./spec_helper"

describe DI::ContainerMixin do
  it "resolves proper instance" do
    Container.resolve(Foo).class.should eq(Foo)
  end

  it "resolves proper instance by block" do
    instance = Container.resolve(BlockFoo)
    instance.class.should eq(BlockFoo)
    instance.should_not eq(Container.resolve(BlockFoo))
  end

  it "memoizes instance when memoize: true" do
    instance = Container.resolve(MemoFoo)
    instance.should eq(Container.resolve(MemoFoo))
  end

  it "binds item to context when context is set" do
    Container.resolve(ContextFoo, context: Bar).class.should eq(ContextFoo)
  end
end
