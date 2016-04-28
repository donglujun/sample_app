class Issue < ActiveRecord::Base
  belongs_to :employee
  enum level: {
    "低" => 0,
    "中" => 1,
    "高" => 2,
  }

  enum state: {
    "未修复" => 0,
    "已修复" => 1,
  }
end
