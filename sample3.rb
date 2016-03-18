zundoko = %w(ズン ドコ)
result = ''
ready = 'ズンズンズンズンドコ'

loop do
  str = zundoko[rand(100000)%2]
  result << str

  puts str

  if result.end_with?(ready)
    puts 'キ・ヨ・シ'
    break
  end
end
