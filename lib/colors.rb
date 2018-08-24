module Colors
  def self.generate(base: '#ED1869', size: 20)
    base.paint.palette.monochromatic(size: size, as: :hex)
  end
end
