; extends

(jsx_opening_element
  name: (identifier) @jsx.tag
)

(jsx_opening_element
  name: (member_expression (identifier) @jsx.tag (property_identifier) @jsx.tag)
)

(jsx_opening_element
  ((identifier) @jsx.component (#match? @jsx.component "^[A-Z]"))
)

(jsx_opening_element
  (member_expression
    ((identifier) @jsx.component (#match? @jsx.component "^[A-Z]") (property_identifier) @jsx.component)
  )
)

(jsx_closing_element
  name: (identifier) @jsx.tag
)

(jsx_closing_element
  (member_expression (identifier) @jsx.tag (property_identifier) @jsx.tag)
)

(jsx_closing_element
  ((identifier) @jsx.component (#match? @jsx.component "^[A-Z]"))
)

(jsx_closing_element
  (member_expression
    ((identifier) @jsx.component (#match? @jsx.component "^[A-Z]") (property_identifier) @jsx.component)
  )
)

(jsx_opening_element
  (member_expression (identifier) "." @jsx.delimiter)
)

(jsx_closing_element
  (member_expression (identifier) "." @jsx.delimiter)
)

(jsx_self_closing_element
  (identifier) @jsx.tag
)

(jsx_self_closing_element
  ((identifier) @jsx.component (#match? @jsx.component "^[A-Z]"))
)

(jsx_self_closing_element
  (member_expression (identifier) @jsx.tag (property_identifier) @jsx.tag)
)

(jsx_self_closing_element
  (member_expression
    ((identifier) @jsx.component (#match? @jsx.component "^[A-Z]") (property_identifier) @jsx.component)
  )
)
