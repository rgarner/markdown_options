require 'spec_helper'

describe 'Some options for converting HTML to markdown' do
  let(:html) {
    <<-HTML
    <h1>Hi</h1>
    <a href="http://gov.uk ">An external link</a>
HTML
  }

  describe 'Kramdown' do
    before(:all) { puts "Kramdown\n========" }

    let(:doc) { Kramdown::Document.new(html, input: 'html') }

    subject(:markdown) { doc.to_kramdown }

    specify { puts markdown }

    describe 'the header' do
      it { should include('# Hi') }
    end

    describe 'link in footnote form' do
      it { should include '[An external link][1]' }
      it { should include '[1]: http://gov.uk' }
    end
  end
end