require 'spec_helper_acceptance'

describe 'grafanadash::dev' do
  let(:manifest) {
    <<-EOS
      include grafanadash::dev
    EOS
  }
  it 'should run without errors or wthout changes' do
    result = apply_manifest(manifest, :catch_failures => true)
    expect(@result.exit_code).to eq(2).or(eq(0))
  end
  it 'should run a second time without changes' do
    result = apply_manifest(manifest, :catch_changes => true)
    expect(@result.exit_code).to eq 0
  end
end
