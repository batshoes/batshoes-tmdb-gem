RSpec.describe BatShoes::Tmdb::GetSomeContent do
  context "when correct response received" do
    let(:params) {{params: "hash"}}
    let(:response) {"{\"adult\":false,
                            \"backdrop_path\":\"/2blmxp2pr4BhwQr74AdCfwgfMOb.jpg\",
                            \"belongs_to_collection\":{ \"id\":120794,\"name\":\"Batman Collection (Original Series)\",
                                                        \"poster_path\":\"/adQxUvQW8HXNsvMG5aj71pHh9T.jpg\",
                                                        \"backdrop_path\":\"/cLnP8V27ZX44QDz4ZsgHTUAg7f6.jpg\"},
                            \"budget\":35000000,
                            \"genres\":[
                              { \"id\":14,
                                \"name\":\"Fantasy\" },
                              { \"id\":28,
                                \"name\":\"Action\" }],
                            \"homepage\":\"\",
                            \"id\":268,
                            \"imdb_id\":\"tt0096895\",
                            \"original_language\":\"en\",
                            \"original_title\":\"Batman\",
                            \"overview\":\"The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham's underworld.\",
                            \"popularity\":3.470417,
                            \"poster_path\":\"/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg\",
                            \"production_companies\":[
                              { \"name\":\"PolyGram Filmed Entertainment\",
                                \"id\":1382 },
                              { \"name\":\"The Guber-Peters Company\",
                                \"id\":4357 },
                              { \"name\":\"Warner Bros.\",
                                \"id\":6194 }],
                            \"production_countries\":[
                              { \"iso_3166_1\":\"GB\",
                                \"name\":\"United Kingdom\" },
                              { \"iso_3166_1\":\"US\",
                                \"name\":\"United States of America\" }],
                            \"release_date\":\"1989-06-23\",
                            \"revenue\":411348924,
                            \"runtime\":126,
                            \"spoken_languages\":[
                              { \"iso_639_1\":\"en\",
                                \"name\":\"English\" },
                              { \"iso_639_1\":\"fr\",
                                \"name\":\"Français\" }],
                            \"status\":\"Released\",
                            \"tagline\":\"Have you ever danced with the devil in the pale moonlight?\",
                            \"title\":\"Batman\",
                            \"video\":false,
                            \"vote_average\":6.8,
                            \"vote_count\":906}"}
    before do
      allow_any_instance_of(TmdbIdRequest).to receive(:call)
        .and_return(JSON.parse response)
    end
    
    subject do
      described_class.new.tmdb_request(params)
    end

    it {expect(subject['title']).to eq "Batman"}
    it {expect(subject['runtime']). to be_class Time}
  end
end