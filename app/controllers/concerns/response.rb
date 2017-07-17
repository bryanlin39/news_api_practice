module Response
  def json_response(object, status = 200)
    render json: object.to_json(:include => :articles), status: status
  end
end
