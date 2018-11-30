module CartsHelper
  def render_if(condition, record)
    if condition
      render record
    end
  end
end
