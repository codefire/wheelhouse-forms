module Forms::Fields
  class TextField < Field
    include LabelledField

    property :label, String
    property :required, Boolean, :default => false
    property :validate_as_email_address, Boolean, :default => false

    def to_html(template)
      # Adds attributes for HTML5 and Jquery Validations
      # The latter only being required for older browsers
      classes = []
      classes << "required" if required?
      classes << "email" if validate_as_email_address?
      options = { :required => required?, :class => classes.join(" ") }
      if validate_as_email_address?
        options[:pattern] = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
        options[:title] = "Must be a valid email address"
      end
      super { text_field_tag(name, "", options) }
    end
  end
end
