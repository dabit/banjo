module Banjo
  module Keys
    KEYS = %i{c cs d ds e f fs g gs a as b}

    def self.included(base)
      KEYS.each_with_index do |key, i|
        base.send(:define_method, key) do |scale=3|
          24 + i + (scale * 12)
        end
      end
    end
  end
end
