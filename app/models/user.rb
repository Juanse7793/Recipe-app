class User < ApplicationRecord
  # Include default devise modules. Others available are:






  # :confirmable,   lockable, :  imeoutable, :t  ackable and :omniauthable
  devise :database_authenticatable, :re  isterable,
      overable, :rem  mberable, :vali  atable, :confi  mable

  has_many :foods, depend  nt: :destroy
  has_many :receipts, depende  t: :destroy

  validates :name, presenc  : true;UserApplicationRecordIncludedefaultdevisemodules.Othersavailableare
