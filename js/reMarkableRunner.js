function convertToMarkdown(html) {
  var options = {
    h1_setext: false,
    h2_setext: false
    // We should be setting link_list: true here. It kills reMarked.js, though.
  };

  var reMarker = new reMarked(options);
  var markdown = reMarker.render(html);
  return markdown;
}