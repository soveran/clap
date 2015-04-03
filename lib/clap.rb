class Clap
  attr :argv
  attr :opts

  def self.run(args, opts)
    new(args, opts).run
  end

  def initialize(argv, opts)
    @argv = argv.dup
    @opts = opts.each_with_object({}) do |(names, block), result|
      Array(names).each { |name| result[name] = block }
    end
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
end
