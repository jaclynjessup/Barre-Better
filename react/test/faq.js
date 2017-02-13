import App from '../src/components/App';
import data from '../src/constants/data';

describe('Question Index', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <App data={data} />
    );
    wrapper.setState({question:data.question, answers:data.answers})
  });

  afterEach(() => {
    wrapper.unmount();
  });

  describe('visiting the main page', () => {
    it('has the question body and answer choices', () => {
      let pageText = wrapper.text();

      expect(pageText).toMatch('What is Barre?');
      expect(pageText).toMatch('Barre');
      expect(pageText).toMatch('Tube');
      expect(pageText).toMatch('Socks');
      expect(pageText).toMatch('Weights');
      expect(pageText).toMatch('Ball');
    });
  });
});
