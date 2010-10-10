require File.expand_path("../lib/clap", File.dirname(__FILE__))

test "flag with argument" do
  result = Clap.run %w(-x y), "-x" => lambda { |flag| assert flag == "y" }
  assert result == []
end

test "flag with wrong number of arguments" do
  assert_raise(ArgumentError) do
    Clap.run %w(-x), "-x" => lambda { |flag| }
  end
end

test "extract flags with parameters" do
  result = Clap.run %w(a b -x y c), "-x" => lambda { |flag| assert flag == "y" }
  assert result == %w(a b c)
end

test "extract flags with no parameters" do
  result = Clap.run %w(a b -x c), "-x" => lambda {}
  assert result == %w(a b c)
end
