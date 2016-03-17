zun, doko = zundoko = %w(ズン ドコ)

# 無限ループでズン・ドコいずれかを出し続けるEnumrator::Lazy
# loop.lazy.map{ zundoko.sample }

loop.lazy.map{ zundoko.sample }.each_cons(5) do |arr|
  if arr == [zun, zun, zun, zun, doko]
    arr.each { |row| puts row }
    puts 'キ・ヨ・シ'
    break
  else
    puts arr.first
  end
end
