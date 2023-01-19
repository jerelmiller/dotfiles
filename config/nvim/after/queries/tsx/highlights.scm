; inherits: tsx

(jsx_opening_element 
  name: (identifier) @jsx.tag
) 

(jsx_opening_element 
  (nested_identifier (identifier) @jsx.tag)
)

(jsx_opening_element 
  ((identifier) @jsx.component (#lua-match? @jsx.component "^[A-Z]"))
)

(jsx_opening_element 
  (nested_identifier
    ((identifier) @jsx.component (#lua-match? @jsx.component "^[A-Z]"))
  )
)

(jsx_closing_element 
  name: (identifier) @jsx.tag
) 

(jsx_closing_element 
  (nested_identifier (identifier) @jsx.tag)
)

(jsx_closing_element 
  ((identifier) @jsx.component (#lua-match? @jsx.component "^[A-Z]"))
)

(jsx_closing_element 
  (nested_identifier
    ((identifier) @jsx.component (#lua-match? @jsx.component "^[A-Z]"))
  )
)

(jsx_opening_element
  (nested_identifier (identifier) "." @jsx.delimiter)
)

(jsx_closing_element 
  (nested_identifier (identifier) "." @jsx.delimiter)
)

(jsx_self_closing_element
  (identifier) @jsx.tag
)

(jsx_self_closing_element
  ((identifier) @jsx.component (#lua-match? @jsx.component "^[A-Z]"))
)

(jsx_self_closing_element
  (nested_identifier (identifier) @jsx.tag)
)

(jsx_self_closing_element
  (nested_identifier
    ((identifier) @jsx.component (#lua-match? @jsx.component "^[A-Z]"))
  )
)
