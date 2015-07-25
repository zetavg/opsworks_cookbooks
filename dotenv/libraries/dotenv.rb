module Dotenv
  module Escape
    def self.escape(env, pattern, sub)
      Hash[env.map { |key, value| [key, value.nil? ? value : value.gsub(pattern, sub)] }]
    end

    def self.escape_double_quotes(env)
      escape(env, /\"/, "\\\"")
    end
  end
end
