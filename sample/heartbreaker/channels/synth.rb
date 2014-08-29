class Synth < Banjo::Channel
  def channel
    1
  end

  def perform
    play(ds(3)).every(4)

    within(0, 12) do
      play(g(3)).every(4)
    end

    within(32, 44) do
      play(g(3)).every(4)
    end

    within(16, 28) do
      play(f(3)).every(4)
    end

    within(48, 60) do
      play(f(3)).every(4)
    end
  end
end
