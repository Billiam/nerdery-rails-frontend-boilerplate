module ApplicationHelper
  def asset_path_prefix(source="", options={})
    relative_url_root = defined?(config.relative_url_root) && config.relative_url_root
    if relative_url_root
      source = File.join(relative_url_root, source) unless source.starts_with?("#{relative_url_root}/")
    end

    source
  end

  def asset_prefix(source="", options={})
    source = asset_path_prefix(source, options)

    if host = compute_asset_host(source, options)
      source = File.join(host, source)
    end

    source
  end
end
