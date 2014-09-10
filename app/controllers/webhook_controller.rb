class WebhooksController < ApplicationController
require 'json'
def receiver
@processor = WebhookProcessor.new
@processor.process(request.body.read)
end
end