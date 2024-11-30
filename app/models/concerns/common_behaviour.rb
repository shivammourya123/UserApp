module CommonBehaviour
  extend ActiveSupport::Concern

  included do
    # Place code here to execute when the module is included in a model.
    # Example: A shared validation
    validates :text, presence: true, if: -> { self.respond_to?(:text) }
    scope :recent, -> { where('created_at >= ?', 3.days.ago) }

  end

  # Define shared methods here
  # class_methods do
      def common_method
        # Example method accessible in both User and Post models
        "This is a common method for #{self.class.name}"
      end
   # end
end