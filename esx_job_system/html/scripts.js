function selectJob(job) {
    fetch(`https://${GetParentResourceName()}/selectJob`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ job: job })
    }).then(res => res.json()).then(data => {
        console.log('Job selected:', job);
    });
}

window.addEventListener('message', (event) => {
    if (event.data.action === 'showMenu') {
        document.getElementById('menu').style.display = 'block';
    }
});
