class Pagination
  attr_accessor :records,:total_pages
  def initialize(resource, page)
    per_page = resource::PER_PAGE
    total_count = resource.count
    total_pages = total_count/per_page
    page = page.to_i
    total_pages = total_pages > 0 ? total_pages : 1
    limit = per_page + 1 / (total_pages - page + 1) * (total_count % per_page)
    offset = (page - 1) * per_page
    @total_pages = total_pages
    @records = resource.limit(limit).offset(offset)
  end
end