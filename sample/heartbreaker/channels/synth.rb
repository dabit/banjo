class Synth < Banjo::Channel
  def channel
    1
  end

  def perform
    play(ds(3)).every(4)

    play(g(3)).at(0)
    play(g(3)).at(4)
    play(g(3)).at(8)
    play(g(3)).at(12)

    play(f(3)).at(16)
    play(f(3)).at(20)
    play(f(3)).at(24)
    play(f(3)).at(28)

    play(g(3)).at(32)
    play(g(3)).at(36)
    play(g(3)).at(40)
    play(g(3)).at(44)

    play(f(3)).at(48)
    play(f(3)).at(52)
    play(f(3)).at(56)
    play(f(3)).at(60)
  end
end
