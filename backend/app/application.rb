class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)



    # Postin ROUTES

    # Postin Index

    if req.path == '/postins' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [Postin.all.to_json]]
    end
 
   

    # Postin Create
    

    if req.path == ('/postins') && req.post?
      body = JSON.parse(req.body.read)
      postin = Postin.create(body)
      return [201, {'Content-Type' => 'application/json'}, [postin.to_json]]
    end

    # Postin Show

    if req.path.match('/postins/') && req.get?
      id = req.path.split('/')[2]
      begin
        postin = Postin.find(id)
        # the include method allows us to add to the json hash
        return [200, {'Content-Type' => 'application/json'}, [postin.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "postin not found"}.to_json]]
      end
    end

    # Postin Update

    if req.path.match('/postins/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        postin = Postin.find(id)
        postin.update(body)
        return [202, {'Content-Type' => 'application/json'}, [postin.to_json]]

        # below is an example of handling multiple exceptions
        # handling exceptions this way is NOT required or recommended
        # for the phase 3 project

      rescue ActiveRecord::RecordNotFound
        return [404, {'Content-Type' => 'application/json'}, [{message: "postin not found"}.to_json]]
      rescue ActiveRecord::UnknownAttributeError
        return [422, {'Content-Type' => 'application/json'}, [{message: "Could not process your update request"}.to_json]]
      end
    end

    # postin Delete

    if req.path.match('/postins/') && req.delete?
      id = req.path.split('/')[2]
      begin
        postin = Postin.find(id)
        postin.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Postin Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Postin not found"}.to_json]]
      end
    end
    if req.path == '/postins' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [Postin.all.to_json]]
    end
 
    if req.path == '/members' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [Member.all.to_json]]
    end
 

    # Member Create

    if req.path == ('/members') && req.post?
      body = JSON.parse(req.body.read)
      member = Member.create(body)
      return [201, {'Content-Type' => 'application/json'}, [member.to_json]]
    end

    # Member Show

    if req.path.match('/members/') && req.get?
      id = req.path.split('/')[2]
      begin
        member = Member.find(id)
        # the include method allows us to add to the json hash
        return [200, {'Content-Type' => 'application/json'}, [member.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "member not found"}.to_json]]
      end
    end

    # Member Update

    if req.path.match('/members/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        member = Member.find(id)
        member.update(body)
        return [202, {'Content-Type' => 'application/json'}, [Member.to_json]]

        # below is an example of handling multiple exceptions
        # handling exceptions this way is NOT required or recommended
        # for the phase 3 project

      rescue ActiveRecord::RecordNotFound
        return [404, {'Content-Type' => 'application/json'}, [{message: "member not found"}.to_json]]
      rescue ActiveRecord::UnknownAttributeError
        return [422, {'Content-Type' => 'application/json'}, [{message: "Could not process your update request"}.to_json]]
      end
    end

    # member Delete

    if req.path.match('/members/') && req.delete?
      id = req.path.split('/')[2]
      begin
        member = Member.find(id)
        ppstin.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Member Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Member not found"}.to_json]]
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
