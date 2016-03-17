zundoko = %w(ズン ドコ)
zuns = []

loop do
  sample = zundoko.sample

  if sample == 'ズン'
    if zuns.size == 4
      zuns.shift
    else
      zuns << sample
    end
  else
    zuns.clear unless zuns.size == 4
  end

  puts sample

  if zuns == %w(ズン ズン ズン ズン)
    puts 'ドコ'
    puts 'キ・ヨ・シ'
    break
  end
end
