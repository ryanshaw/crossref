require 'spec_helper'

describe Crossref::Metadata do
  it "should generate well formed URLs" do
    url = Crossref.url("10.1002/(SICI)1096-9837", "fake-pid")
    url.should == "http://crossref.org/openurl/?noredirect=true&format=unixref&id=doi:10.1002%2F%28SICI%291096-9837&pid=fake-pid"
  end

  it "should detect valid DOIs" do
    valid = Crossref.valid_doi?("10.1016/j.jaridenv.2006.12.024")
    valid.should be_true

    valid = Crossref.valid_doi?("10.1002/(SICI)1096-9837(199908)24:8<693::AID-ESP992>3.0.CO;2-7")
    valid.should be_true
  end

  it "should detect invalid DOIs" do
    valid = Crossref.valid_doi?("http://dx.doi.org/10.1002/(sici)1096-9837(199604)21:4%3C353::aid-esp568%3E3.0.co;2-8")
    valid.should be_false
  end

  it "should get and parse the xml document for correct DOI's", :vcr do
    crossref = Crossref::Metadata.new(doi: '10.1016/j.jaridenv.2006.12.024', pid: 'fake-pid')
    crossref.title.should == 'Rainfall trends in arid and semi-arid regions of Iran'

    crossref = Crossref::Metadata.new(doi: '10.1002/(SICI)1096-9837(199908)24:8<693::AID-ESP992>3.0.CO;2-7', pid: 'fake-pid')
    crossref.title.should == 'Assessment of soil losses by ephemeral gully erosion using high-altitude (stereo) aerial photographs'
  end

  it "should handle missing documents with grace", :vcr do
    crossref = Crossref::Metadata.new(doi: '10.1000/non-locatable-doi', pid: 'fake-pid')
    crossref.title.should == nil
    crossref.first_author.should == {}
    crossref.authors.should == []
    crossref.published.should == {}
    crossref.published[:year].should == nil
    crossref.published[:month].should == nil
    crossref.journal.should == {}
    crossref.journal[:volume].should == nil
    crossref.journal[:issue].should == nil
    crossref.journal[:first_page].should == nil
    crossref.journal[:last_page].should == nil
    crossref.journal[:full_title].should == nil    
  end
end
