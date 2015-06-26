require "jpstock"
require "ruboty"

module Ruboty
  module Handlers
    class StockPriceJp < Base
      on /stock_price (?<jp_ticker_symbol>.*?)\z/, name: 'stock_price', description: 'Fetch stock price'

      def stock_price(message)
        price = fetch_price(message['jp_ticker_symbol'])
        message.reply(price) if price
      end

      private

      def fetch_price(ticker)
        fetch = JpStock.quote(code: ticker)
        "#{fetch.company_name}: #{fetch.close}円"
      rescue JpStock::QuoteException
        nil
      end
    end
  end
end
