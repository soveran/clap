class Clap
  VERSION = "0.0.1"

  attr :argv
  attr :opts

  def self.run(args, opts)
    new(args, opts).run
  end

  def initialize(argv, opts)
    @argv = argv.reverse
    @opts = opts
  end

  def run
    args = []

    while argv.any?
      item = argv.pop

      if opts[item]

        # Call the lambda with N items from argv,
        # where N is the lambda's arity.
        opts[item].call(*argv.last([opts[item].arity,0].max))
      else

        # Collect the items that don't correspond to
        # flags.
        args << item
      end
    end

    args
  end
end
