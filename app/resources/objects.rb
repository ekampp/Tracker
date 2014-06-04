module Resources

  # Display a list of all the objects, which are currently witin range of you
  #
  class Objects < Lattice::Resource
    allow :get
    accept 'application/json' => :accept_json
    provide_content_type 'application/json' => :to_html
    provide_encoding 'gzip' => :encode_gzip

    def to_html
      [
        {
          hello: 'Lattice'
        }
      ]
    end
  end
end
