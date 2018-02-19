
def data_bag_credentials(data_bag_name, data_bag_item, data_bag_key)
  if !(data_bag_name && data_bag_item && data_bag_key)
    raise 'must provide three values - data_bag_name, data_bag_item, data_bag_key'
  else
    Chef::EncryptedDataBagItem.load(data_bag_name, data_bag_item, data_bag_key)
  end
end

# sssd config generator
module SssdCookbookHelper
  def sssd_config(config)
    new_config = {}
    unless config.nil?
      config.each do |k, v|
        next if v.nil?
        new_config[k] = if v.is_a?(Array)
                          v.join(',')
                        else
                          v
                        end
      end
    end
    new_config
  end
end
