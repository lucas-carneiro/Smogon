#--
# Copyright(C) 2015 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# This file is part of Smogon-API.
#
# Smogon-API is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Smogon-API is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Smogon-API.  If not, see <http://www.gnu.org/licenses/>.
#++

module Smogon
  class API
    METAGAME = 'xy'
    ENDPOINT = 'http://www.smogon.com/dex/api/query?q='

    class << self
      def request(what, name, fields)
        query = {
          what => { 'gen' => METAGAME, 'alias' => aliasize(name) },
          '$'  => fields
        }

        query = JSON.generate(query)
        query = URI.escape(query, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
        response = JSON.parse open("#{ENDPOINT}#{query}").read
        response['status'] == 'success' ? response['result'] : response['message']
      end

      def using_metagame(metagame, &block)
        default_metagame = METAGAME.dup
        METAGAME.replace aliasize(metagame)
        instance_eval(&block).tap do
          METAGAME.replace default_metagame
        end
      end

    private

      def aliasize(string)
        string.downcase.gsub(' ', '_').gsub(/[^a-z_]/i, '')
      end
    end
  end
end
