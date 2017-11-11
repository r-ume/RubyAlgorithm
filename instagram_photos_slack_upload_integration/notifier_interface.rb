module NotifierInterface

  def sends_notification
    raise NotImplementedError
  end

  def sends_image
    raise NotImplementedError
  end

end
