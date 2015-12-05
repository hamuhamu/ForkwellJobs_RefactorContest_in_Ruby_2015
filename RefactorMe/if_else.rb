class Baby
  NAME = 'baby'

  def self.is?
    0..2
  end

end

class LittleChild
  NAME = 'little child'

  def self.is?
    3..6
  end

end

class Child
  NAME = 'child'

  def self.is?
    7..12
  end

end

class Youth
  NAME = 'youth'

  def self.is?
    13..18
  end

end

class Adult
  NAME = 'adult'

  def self.is?
    19...Float::INFINITY
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
