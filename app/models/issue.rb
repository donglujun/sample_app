class Issue < ActiveRecord::Base
  enum level: {
    low: 0,
    middle: 1,
    high: 2
  }

  enum state: {
    open: 0,
    resolved: 1,
  }
end
