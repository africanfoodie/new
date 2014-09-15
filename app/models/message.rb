class Message < ActiveRecord::Base
validates_presence_of :name, :subject, :body
end
