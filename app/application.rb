class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    # GYM MEMBER ROUTES

    # Gym Member Index

    if req.path == ('/gym_members') && req.get?
      return [200, {'Content-Type' => 'application/json'}, [GymMember.all.to_json]]
    end

    # Gym Member Create

    if req.path == ('/gym_members') && req.post?
      body = JSON.parse(req.body.read)
      gym_member = GymMember.create(body)
      return [201, {'Content-Type' => 'application/json'}, [gym_member.to_json]]
    end

    # Gym Member Show

    if req.path.match('/gym_members/') && req.get?
      id = req.path.split('/')[2]
      begin
        gym_member = GymMember.find(id)
        return [200, {'Content-Type' => 'application/json'}, [gym_member.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Gym Member not found"}.to_json]]
      end
    end

    # Gym Member Update

    if req.path.match('/gym_members/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        gym_member = GymMember.find(id)
        gym_member.update(body)
        return [202, {'Content-Type' => 'application/json'}, [gym_member.to_json]]

        # below is an example of handling multiple exceptions
        # handling exceptions this way is NOT required or recommended
        # for the phase 3 project

      rescue ActiveRecord::RecordNotFound
        return [404, {'Content-Type' => 'application/json'}, [{message: "Gym Member not found"}.to_json]]
      rescue ActiveRecord::UnknownAttributeError
        return [422, {'Content-Type' => 'application/json'}, [{message: "Could not process your update request"}.to_json]]
      end
    end

    # Gym Member Delete

    if req.path.match('/gym_members/') && req.delete?
      id = req.path.split('/')[2]
      begin
        gym_member = GymMember.find(id)
        gym_member.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Gym Member Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Gym Member not found"}.to_json]]
      end
    end

    # GYM ROUTES

    # Gym Index

    if req.path == '/gyms' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [Gym.all.to_json]]
    end

    # Gym Create

    if req.path == ('/gyms') && req.post?
      body = JSON.parse(req.body.read)
      gym = Gym.create(body)
      return [201, {'Content-Type' => 'application/json'}, [gym.to_json]]
    end

    # Gym Show

    if req.path.match('/gyms/') && req.get?
      id = req.path.split('/')[2]
      begin
        gym = Gym.find(id)
        # Note defining specific attributes
        return [200, {'Content-Type' => 'application/json'}, [{name: gym.name, location: gym.location, monthly_price: gym.monthly_price, gym_members: gym.gym_members}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Gym not found"}.to_json]]
      end
    end

    # Gym Update

    if req.path.match('/gyms/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        gym = Gym.find(id)
        gym.update(body)
        return [202, {'Content-Type' => 'application/json'}, [gym.to_json]]

        # below is an example of handling multiple exceptions
        # handling exceptions this way is NOT required or recommended
        # for the phase 3 project

      rescue ActiveRecord::RecordNotFound
        return [404, {'Content-Type' => 'application/json'}, [{message: "Gym not found"}.to_json]]
      rescue ActiveRecord::UnknownAttributeError
        return [422, {'Content-Type' => 'application/json'}, [{message: "Could not process your update request"}.to_json]]
      end
    end

    # Gym Delete

    if req.path.match('/gyms/') && req.delete?
      id = req.path.split('/')[2]
      begin
        gym = Gym.find(id)
        gym.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Gym Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Gym not found"}.to_json]]
      end
    end

    # static route to test rack
    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      res.write "Path Not Found"

    end

    res.finish
  end

end
