class AgeCategory

  def self.name
    self::NAME
  end

  def self.fromTo
    self::LOWER_LIMIT..self::UPPER_LIMIT
  end

end

class Baby < AgeCategory
  NAME = 'baby'
  LOWER_LIMIT = 0
  UPPER_LIMIT = 2
end

class LittleChild < AgeCategory
  NAME = 'little child'
  LOWER_LIMIT = 3
  UPPER_LIMIT = 6
end

class Child < AgeCategory
  NAME = 'child'
  LOWER_LIMIT = 7
  UPPER_LIMIT = 12
end

class Youth < AgeCategory
  NAME = 'youth'
  LOWER_LIMIT = 13
  UPPER_LIMIT = 18
end

class Adult < AgeCategory
  NAME = 'adult'
  LOWER_LIMIT = 13
  UPPER_LIMIT = Float::INFINITY
end

class CategorizeByAge

  def initialize(age)
    0 <= age or raise
    @age = age
  end

  def get

    case @age
    when Baby.fromTo
      Baby.name
    when LittleChild.fromTo
      LittleChild::NAME
    when Child.fromTo
      Child.name
    when Youth.fromTo
      Youth.name
    when Adult.fromTo
      Adult.name
    end
  end

end

require 'test/unit'
class CategorizeByAgeTest < Test::Unit::TestCase

  data(
    '0〜2才の間_下限'   => ['baby',         0],
    '0〜2才の間_上限'   => ['baby',         2],
    '3〜6才の間_下限'   => ['little child', 3],
    '3〜6才の間_上限'   => ['little child', 6],
    '7〜12才の間_下限'  => ['child',        7],
    '7〜12才の間_上限'  => ['child',        12],
    '13〜18才の間_下限' => ['youth',        13],
    '13〜18才の間_上限' => ['youth',        18],
    '19才以上_下限'     => ['adult',        19],
  )
  def test_年齢に応じた区分を返すこと(data)
    expected, age = data
    byAge = CategorizeByAge.new(age)
    assert_equal(expected, byAge.get())
  end

  def test_年齢が負数であれば例外を返すこと
    assert_raise(RuntimeError) { CategorizeByAge.new(-1) }
  end

end
