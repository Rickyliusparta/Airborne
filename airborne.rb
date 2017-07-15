require 'spec_helper'

describe "postcode works" do

# it "should report to a single postcode" do
# 		x = get '/sm69rf'
# 		y = JSON.parse(x)
# 		y.each do |key,value|
# 			puts key,value	
# 		end
# 	end

	it "should report to a single postcode" do
		x = get '/sm69rf'
		y = JSON.parse(x)
		expect(y['result']['postcode']).to eq "SM6 9RF"
		
	end

	it 'should return the quality vaule' do
		x = get '/sm69rf'
		y = JSON.parse(x)
		expect(y['result']['quality']).to be 1
	end

	it 'should return the correct easting vaule' do
		get '/sm69rf'
		expect_json(result: {eastings: 529536}) 
		end

	it 'should return the correct northings value' do
		get '/sm69rf'
		expect_json(result: {northings: 163297})
	end

	it 'should return admin district with values' do
		x = get '/sm69rf'
		y = JSON.parse(x)
		expect(y['result']['codes']['admin_district']).to eq 'E09000029'
	end

	it 'should return admin district with values' do
		get '/sm69rf'
		expect_json(result: {codes: {admin_district: 'E09000029'}})
	end

	it 'should return something' do
		get '/sm69rf'
		expect_json(:result {:country => England})
	end
	
	it 'should get all postcode' do
		get '/sm69rf'
		expect_json('result', {:postcode => 'SM6 9RF', :quality => 1, :eastings => 529536, :northings => 163297, :country => 'England', :nhs_ha => 'London', :longitude => -0.141137589483951, :latitude => 51.3539906003041, :parliamentary_constituency => 'Carshalton and Wallington', :european_electoral_region => 'London', :primary_care_trust => 'Sutton and Merton', :region => 'London', :lsoa => 'Sutton 017A', :msoa => 'Sutton 017', :incode => '9RF', :outcode => 'SM6', :admin_district => 'Sutton', :parish => 'Sutton, unparished area', :admin_county => nil, :ccg => 'NHS Sutton', :nuts => 'Merton, Kingston upon Thames and Sutton', ':codes', :admin_district => 'E09000029'}})
	end
end


