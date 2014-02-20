module Jasmine::Headless::FileChecker
  def excluded_formats
    ::Jasmine::Headless::EXCLUDED_FORMATS
  end

  def bad_format?(file)
    return if file.nil?

    excluded_formats.any? do |format|
      file[%r{\.#{format}(\.|$)}]
    end
  end

  def alert_bad_format(file)
    Jasmine::Headless.warn("[%s] %s: %s" % [ Rainbow('Skipping File').color(:red), Rainbow(file).color(:yellow), Rainbow("unsupported format").color(:white) ])
  end

  def alert_if_bad_format?(file)
    if result = bad_format?(file)
      alert_bad_format(file)
    end

    result
  end
end
