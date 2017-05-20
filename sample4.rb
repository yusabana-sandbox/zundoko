# refs. http://qiita.com/yancya/items/1167e9764719151d0c80
# http://qiita.com/kasei-san/items/0392097791d3a5998216
class ZunDoko1
  def initialize
    puts ''
    puts '##### ZunDoko1 #####'
  end

  def zundoko
    z, d = zd = ['ズン', 'ドコ']
    w1, w2, w3, w4, w5 = 5.times.map { nil }

    until [w1, w2, w3, w4, w5] == [z, z, z, z, d]
      w1, w2, w3, w4, w5 = w2, w3, w4, w5, zd.sample.tap(&method(:print))
      p [w1, w2, w3, w4, w5] ## デバッグ目的
    end

    print 'キ・ヨ・シ！'
  end
end

# aryに値を入れ続けて無限のwhileを構成する
class ZunDoko2
  def initialize
    puts ''
    puts '##### ZunDoko2 #####'
  end

  def zundoko
    z,d = zd = %w(ズン ドコ)
    ary = []

    while ary << zd.sample
      print ary.last
      if ary.last(5) == [z, z, z, z, d]
        print 'キ・ヨ・シ！'
        break
      end
    end
  end
end

# each_consで5こずつ処理
# 注) 毎回5個ずつ処理するので厳密な流れは計算できない
class ZunDoko3
  def initialize
    puts ''
    puts '##### ZunDoko3 #####'
  end

  def zundoko
    z, d = zd = %w(ズン ドコ)
    loop.lazy.map { zd.sample }.each_cons(5) do |nominees|
      nominees.each(&method(:print))
      if nominees == [z, z, z, z, d]
        print 'キ・ヨ・シ！'
        break
      end
      puts ''
    end
  end
end

class ZunDoko4
  def initialize
    puts ''
    puts '##### ZunDoko4 #####'
  end

  def zundoko
    z, d = zd = %w(ズン ドコ)
    loop.lazy.map { zd.sample }.inject([]) do |nominees, w|
      if nominees.last(5) == [z, z, z, z, d]
      # if nominees.last(5).tap(&method(:p)) == [z, z, z, z, d] # debug
        print 'キ・ヨ・シ！'
        break
      end
      nominees << w.tap(&method(:print))
    end
  end
end


ZunDoko1.new.zundoko
ZunDoko2.new.zundoko
ZunDoko3.new.zundoko
ZunDoko4.new.zundoko
