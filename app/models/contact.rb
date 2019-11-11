class Contact < ApplicationRecord

    # associações
    belongs_to :kind#, optional: true
    has_many :phones

    def birthdate_br
      I18n.l(self.birthdate) unless self.birthdate.blank?
    end


        
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
