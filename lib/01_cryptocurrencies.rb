
module  Cryptomoney

    local_dir = File.expand_path('../', __FILE__)
    $LOAD_PATH.unshift(local_dir)
    require "KEYS.rb"
    require "VALUES.rb"


HASH = [KEY, VALUE].transpose.to_h

#La ou les crypto qui ont la plus grosse valeur.
    def self.valueplus
        puts "La monnaie qui à la plus grosse valeur est : #{HASH.sort_by {|k, v| v.to_f}.last[0]}\n\n"
    end

#La ou les crypto qui ont la plus petite valeur.
    def self.valuemoins
        puts "Les monnaies qui ont la plus faible valeur sont : #{HASH.sort_by {|k, v| v.to_f}.first(2)}\n\n"
    end

#Les devises dont le cours est inférieur à 6000
    def self.undersixthousand
        arr = []
        arr = HASH.map { |name, price| [name] if price.to_f < 6000 }
        puts "Les devises dont la valeur est inférieure à 6000 sont"
        puts arr
    end

#La devise la plus chère parmi celles dont le cours est inférieur à 6000.
    def self.expensivesixthousand
        arr = []
        arr = HASH.map { |name, price| [name, price] if price.to_f < 6000 }
        puts "\nLa monnaie ayant la plus grosse valeur parmis celles dont le cours est inferieur a 6000 est :\n#{arr.sort_by {|k, v| v.to_f}.last[0]}"
    end
    
    def self.start
        puts "~> Running code..."
        puts "------------------\n\n"
        Cryptomoney.valueplus
        Cryptomoney.valuemoins
        Cryptomoney.undersixthousand
        Cryptomoney.expensivesixthousand
    end

    Cryptomoney.start
    
end



