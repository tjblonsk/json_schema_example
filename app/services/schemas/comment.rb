module Schemas
  class Comment
    def contents
      json_string = File.read("#{Rails.root}/config/schemas/comment.json")
      JSON.parse(json_string)
    end

    def self.load
      ::CatJsonSchema ||= self.new.contents
    end
  end
end
