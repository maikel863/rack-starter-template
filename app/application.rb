class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)
    
    # Player Index

    if req.path == '/players' && req.get?
       players = Player.all
      return [
        200, 
      { 'Content-Type' => 'application/json' }, 
      [ players.to_json ]
    ]
    end

    # Player Create

    if req.path == ('/players') && req.post?
      body = JSON.parse(req.body.read)
      player = Player.create(body)
      return [201, {'Content-Type' => 'application/json'}, [player.to_json]]
    end

    # Player Show

    if req.path.match('/players/') && req.get?
      id = req.path.split('/')[2]
      begin
        player = Player.find(id)
        return [200, {'Content-Type' => 'application/json'}, [player.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Player not found"}.to_json]]
      end
    end

    # Player Update

    if req.path.match('/players/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        player = Player.find(id)
        player.update(body)
        return [202, {'Content-Type' => 'application/json'}, [player.to_json]]
      rescue ActiveRecord::RecordNotFound
        return [404, {'Content-Type' => 'application/json'}, [{message: "Player not found"}.to_json]]
      end
    end
    
    # Player Delete

    if req.path.match('/players/') && req.delete?
      id = req.path.split('/')[2]
      begin
        player = Player.find(id)
        player.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Player Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Player not found"}.to_json]]
      end
    end

    # Team Index

  elsif req.path == '/teams' && req.get?
    teams = Team.all
   return [
     200, 
   { 'Content-Type' => 'application/json' }, 
   [ teams.to_json ]
 ]
    # Team Show
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
    {}, 
    [ { error: 'team not found' }.to_json ]
  ]
end  

    # Team Create

    if req.path == ('/teams') && req.post?
      body = JSON.parse(req.body.read)
      team = Team.create(body)
      return [201, {'Content-Type' => 'application/json'}, [team.to_json]]
    end

    # Team Update

    if req.path.match('/teams/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        team = Team.find(id)
        team.update(body)
        return [202, {'Content-Type' => 'application/json'}, [team.to_json]]
      rescue ActiveRecord::RecordNotFound
        return [404, {'Content-Type' => 'application/json'}, [{message: "Team not found"}.to_json]]
      end
    end

    # Team Delete

    if req.path.match('/teams/') && req.delete?
      id = req.path.split('/')[2]
      begin
        team = Team.find(id)
        team.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Team Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Team not found"}.to_json]]
      end
    end

    # Route testing

    if req.path.match(/test/)
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      res.write "Path Not Found"

    end

    res.finish
  end

end