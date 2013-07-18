require 'spec_helper'

describe 'Some options for converting HTML to markdown' do
  let(:html) {
    <<-HTML
    <h1>Hi</h1>
    <a href="http://gov.uk ">An external link</a>
    <p>Here's some body text.</p>
    <h2>Images</h2>
    <p>Here's a little more, this time with this
      <img title="Larry staring" src="http://stream1.gifsoup.com/view/22911/larry-stare-o.gif"> in it.</p>

HTML
  }

  shared_examples 'expected markdown output' do
    specify { puts markdown }

    describe 'the header' do
      it { should include('# Hi') }
    end

    describe 'link in footnote form' do
      it { should include '[An external link][1]' }
      it { should include '[1]: http://gov.uk' }
    end
  end

  describe 'Kramdown' do
    it_behaves_like 'expected markdown output'

    before(:all) { puts "Kramdown\n========" }

    subject(:markdown) { Kramdown::Document.new(html, input: 'html').to_kramdown }

    let(:doc) {  }
  end

  describe 'In-browser options' do
    describe 'reMarked.js' do
      it_behaves_like 'expected markdown output'

      before(:all) { puts "\nreMarked.js\n===========" }

      let(:compiledJS) do
        ExecJS.compile(
            File.read('js/reMarked.js') + "\n" +
            File.read('js/reMarkableRunner.js')
        )
      end

      subject(:markdown) do
        compiledJS.call('run', html)
      end
    end
  end
end