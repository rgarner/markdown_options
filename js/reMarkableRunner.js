function convertToMarkdown(html) {
  var options = {

  };

  var reMarker = new reMarked(options);
  var markdown = reMarker.render(html);
  return markdown;
}