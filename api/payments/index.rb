require 'compensated'

Handler = Proc.new do |req, res|
  input = JSON.parse(req.body, symbolize_names: true)

  res.status = 200
  res['Content-Type'] = 'application/json; charset=utf-8'
  res.body = JSON.dump({ input: input })
end
