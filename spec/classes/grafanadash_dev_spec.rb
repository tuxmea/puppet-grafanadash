require 'spec_helper'

describe 'grafanadash::dev' do
  test_on = {
    :supported_os => [
      {
        'operatingsystem' => 'RedHat',
        'operatingsystemrelease' => ['6', '7']
      }
    ]
  }
  on_supported_os(test_on).each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('grafanadash::dev') }
    end
  end
end
