class MemberCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  MEMBER_NUM = 3  # 同時にメンバーを作成する数
  attr_accessor :collection  # ここに作成したメンバーモデルが格納される

  # 初期化メソッド
  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|
        Member.new(
          team_id: value['team_id'],
          uniform_number: value['uniform_number'],
          grade: value['grade'],
          first_name: value['first_name'],
          last_name: value['last_name']
        )
      end
    else
    self.collection = MEMBER_NUM.times.map{ Member.new }
    end
  end

# レコードが存在するか確認するメソッド
  def persisted?
    false
  end

  # コレクションをDBに保存するメソッド
  def save
    is_success = true
    ActiveRecord::Base.transaction do
      collection.each do |result|
        # バリデーションを全てかけたいからsave!ではなくsaveを使用
        is_success = false unless result.save
      end
      # バリデーションエラーがあった時は例外を発生させてロールバックさせる
      raise ActiveRecord::RecordInvalid unless is_success
    end
    rescue
      p 'エラー'
    ensure
      return is_success
  end

end