require 'rails_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

RSpec.describe ApplicationController do
  describe 'current_user' do
    it 'returns the name of the current user' do
      i_am = 'Kate Libby'
      @request.session[:name] = i_am
      expect(subject.current_user).to eq i_am
    end

    it 'returns nil if nobody is logged in' do
      expect(subject.current_user).to be nil
    end
  end
end
