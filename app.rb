require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @rev_name = params[:name].reverse
    "#{@rev_name}"
  end

  get '/square/:number' do
    @squared = params[:number].to_i
    "#{@squared ** 2}"
  end

  get '/say/:number/:phrase' do
    @phrase = params[:phrase].split("%20")
    @n = params[:number].to_i
    "#{@phrase.join(" ")} " * @n
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    params.collect do |k,v|
      params[k]
    end.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do
    @x = params[:number1].to_i
    @y = params[:number2].to_i

    case params[:operation]
    when "add"
      "#{@x + @y}"
    when "subtract"
      "#{@x - @y}"
    when "multiply"
      "#{@x * @y}"
    when "divide"
      "#{@x / @y}"
    end
  end

end
