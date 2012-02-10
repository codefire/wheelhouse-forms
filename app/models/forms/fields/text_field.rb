module Forms::Fields
  class TextField < Field
    include LabelledField

    property :label, String
    property :required, Boolean, :default => false
    property :validate_as_email_address, Boolean, :default => false

    def to_html(template)
      # Adds attributes for HTML5 Validations
      options = { :required => required? }
      if validate_as_email_address?
        options[:pattern] = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
        options[:title] = "Must be a valid email address"
      end
      super { text_field_tag(name, "", options) }
    end
  end
end
