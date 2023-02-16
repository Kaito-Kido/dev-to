module ReactsHelper
  def reacted?(reactable)
    return unless user_signed_in?

    reactable.reacts.find_by(user_id: current_user.id).present?
  end

  def post?(reactable)
    reactable.instance_of?(::Post)
  end
end
