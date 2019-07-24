class ArrayInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    @builder.select(attribute_name, User.all.sort_by(&:name).collect {|p| [ p.name, p.id ] }, {}, input_html_options.merge(value: nil, name: "#{object_name}[#{attribute_name}][]"))
  end
end