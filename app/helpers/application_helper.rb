# frozen_string_literal: true

require 'basketdo/kaminari/json_paginator'

module ApplicationHelper
  include Basketdo::Kaminari::JsonPaginator
end
