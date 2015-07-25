require 'json'

node['webhooks_setup_url'].each do |url|

  data = Hash[node[:opsworks][:instance]]
  data.delete_if { |k, v| ![:id, :hostname, :instance_type, :public_dns_name, :private_dns_name, :ip, :private_ip, :architecture, :layers, :backends, :aws_instance_id, :region, :availability_zone, :subnet_id, :infrastructure_class].include?(k.to_sym) }
  data[:event] = 'Setup'
  data_json = data.to_json

  http_request "post data to specified URL" do
    action :post
    url url
    message data_json
    headers("Content-Type" => "application/json")
  end

end if node['webhooks_setup_url'].is_a?(Array)
