import $ from 'jquery';


const progressBar = () => {
  const progress = document.querySelector('.progress-1-done');
  const data = document.querySelector('.progress-1-done');
  const value = document.querySelector('.visualized-value');
  const result = (gon.posts * 100) / 50;

  if (data) {

    data.setAttribute('data-done', result);
    value.innerHTML = `${result}%`;

    setTimeout(() => {
      progress.style.width = progress.getAttribute('data-done') + '%';
      progress.style.opacity = 1;
    }, 500)

  }

}

export { progressBar }
