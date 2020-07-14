class Docfile < ApplicationRecord
  has_one_attached :doc_file
  belongs_to :file_type

  def self.splitPayroll(payroll)
    reader = PDF::Reader.new(payroll.tempfile)    
    reader.pages.each_with_index do |page,i|
      data = page.raw_content.scan(/\(.*?\)/)
      pdf_name =   "#{data[15].gsub(/[()]/, "")}"
      pdf = CombinePDF.new
      pdf << CombinePDF.load(payroll.tempfile.path).pages[i]
      pdf.save "#{pdf_name}.pdf"  
      temp = Docfile.new(
        name:  "#{pdf_name} - #{Date.current}",
        file_type_id: 5,
      )   
      temp.doc_file.attach(
        io: File.open("#{pdf_name}.pdf"),
        filename:"#{pdf_name} - #{Date.current}.pdf" 
      )          
      temp.save!
      File.delete("#{pdf_name}.pdf")  
    end    
  end
end
