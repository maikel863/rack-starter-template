class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == '/players' && req.get?
       players = Player.all
      return [
        200, 
      { 'Content-Type' => 'application/json' }, 
      [ players.to_json ]
    ]

  elsif req.path == '/teams' && req.get?
    teams = Team.all
   return [
     200, 
   { 'Content-Type' => 'application/json' }, 
   [ teams.to_json ]
 ]

elsif req.path.match(/teams/) && req.get?
  id = req.path.split('/')[2]
  team = Team.find_by(id: id)
  if team
    players = team.players
    team_res = {
      name: team.name,
      location: team.location,
      players: players
    }
 return [
   200, 
 { 'Content-Type' => 'application/json' }, 
 [ team_res.to_json ]
  ]
else
  return  [
    204,
    { 'Content-Type' => 'application/json' }, 
    [ { error: 'team not found' }.to_json ]
  ]
end  

    else
      res.write "Path Not Found"

    end

    res.finish
  end

end