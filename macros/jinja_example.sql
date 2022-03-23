
{#
-- setting simple variables and compiling them
{% set reusable_string = 'my very valuable reusable string;' %}
{% set reusable_string_2 = 'but this string is more valuable' %}

{{ reusable_string }} {{ reusable_string_2}}

#}

-- creating a list for a variable 
{% set my_first_list=['green', 'blue', 'red', 'yellow'] %}

-- give me the first color in the list 
{{ my_first_list[0]}}

-- a for loop to use with the list
{% for color in my_first_list %}

    My favorite color is {{ color }}

{% endfor %}



-- if logicals with jinja
{% set temperature = 45 %}

{% if temperature < 55 %}
    Time for a hot latte
{% else %}
    Time for an iced mocha
{% endif %}



-- combining if statement and loops and eliminating whitespace

{%- set foods = ['pizza', 'onion ring', 'burger', 'fries'] -%}

{%- for food in foods -%}
    {%- if food == 'burger' -%}
      {%- set food_type = 'snack' -%}
    {%- else -%}
      {%- set food_type = 'veggies' -%}    
    {%- endif -%}
    
The {{ food }} is my favorite {{ food_type }}

{% endfor %}



-- dictionary example 
{%- set example_dictionary = {
  'model': 'Carrera',
  'year': '2009',
  'cost': '$100,000.00'
} -%}

My favorite car is the {{ example_dictionary['model'] }} from {{ example_dictionary['year'] }} which costs {{ example_dictionary['cost'] }}
