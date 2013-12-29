class Clap
  attr :argv
  attr :opts

  def self.run(args, opts)
    new(args, opts).run
  end

  def initialize(argv, opts)
    @argv         = argv.dup
    @opts         = opts
    @opts["-h"] ||= lambda { puts help and exit }
  end

  def run
    args = []

    while argv.any?

      item = argv.shift
      flag = opts[item]

      if flag

        # Work around lambda semantics in 1.8.7.
        arity = [flag.arity, 0].max

        # Raise if there are not enough parameters
        # available for the flag.
        if argv.size < arity
          raise ArgumentError
        end

        # Call the lambda with N items from argv,
        # where N is the lambda's arity.
        flag.call(*argv.shift(arity))
      else

        # Collect the items that don't correspond to
        # flags.
        args << item
      end
    end

    args
  end

  def help
    @opts.each_with_object "options:\n\n" do |(flag, arg), help|
      help << "    #{flag}"

      unless arg.parameters.empty?
        arg.parameters.each { |(_,name)| help << " #{name}" }
      end

      help << "\n"
    end
  end
end
