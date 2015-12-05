class Baby
  NAME = 'baby'
  LOWER_LIMIT = 0
  UPPER_LIMIT = 2

  def self.is?
    LOWER_LIMIT..UPPER_LIMIT
  end

end

class LittleChild
  NAME = 'little child'
  LOWER_LIMIT = 3
  UPPER_LIMIT = 6

  def self.is?
    LOWER_LIMIT..UPPER_LIMIT
  end

end

class Child
  NAME = 'child'
  LOWER_LIMIT = 7
  UPPER_LIMIT = 12

  def self.is?
    LOWER_LIMIT..UPPER_LIMIT
  end

end

class Youth
  NAME = 'youth'
  LOWER_LIMIT = 13
  UPPER_LIMIT = 18

  def self.is?
    LOWER_LIMIT..UPPER_LIMIT
  end

end

class Adult
  NAME = 'adult'
  LOWER_LIMIT = 13
  UPPER_LIMIT = Float::INFINITY

  def self.is?
    LOWER_LIMIT..UPPER_LIMIT
  end

end

class ClassificationByAge

  def initialize(age)
    0 <= age or raise
    @age = age
  end

  def get

    case @age
    when Baby.is?
      Baby::NAME
    when LittleChild.is?
      LittleChild::NAME
    when Child.is?
      Child::NAME
    when Youth.is?
      Youth::NAME
    when Adult.is?
      Adult::NAME
    end
  end

end

require 'test/unit'
class ClassificationByAgeTest < Test::Unit::TestCase

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
    byAge = ClassificationByAge.new(age)
    assert_equal(expected, byAge.get())
  end

  def test_年齢が負数であれば例外を返すこと
    assert_raise(RuntimeError) { ClassificationByAge.new(-1) }
  end

end
