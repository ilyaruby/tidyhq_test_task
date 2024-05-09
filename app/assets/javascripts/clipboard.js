document.addEventListener('DOMContentLoaded', function () {
  const copyButton = document.getElementById('copyButton');
  const urlToCopy = document.getElementById('shortUrl').textContent;  // Assuming you have an element with the ID 'short-url' that contains the URL

  copyButton.addEventListener('click', function (event) {
    event.preventDefault();  // Prevent the default anchor behavior
    navigator.clipboard.writeText(urlToCopy).then(() => {
      alert('URL copied to clipboard!');
    }).catch(err => {
      console.error('Failed to copy:', err);
    });
  });
});

