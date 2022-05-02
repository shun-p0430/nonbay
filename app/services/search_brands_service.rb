class SearchBrandsService
  def self.search(search)
    if search != ""
      Brand.where('name' LIKE(?), "%#{search}%")
    else
      Brand.all
    end
  end
end