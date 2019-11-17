class Contact < ApplicationRecord

    # associações
    belongs_to :kind#, optional: true
    has_many :phones
    has_one :address

    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true




    #def birthdate_br
    #  I18n.l(self.birthdate) unless self.birthdate.blank?
    #end


        
    #end
    #def author
     #   "Wagner Abrantes"
    #end

    #def kind_description
     #   self.kind.description
    #end

    #def as_json(options={})
       # super(
      #      root: true,
     #       methods: [ :kind_description, :author ]
    #    )
   # end

  
end
