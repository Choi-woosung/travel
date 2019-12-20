document.addEventListener('DOMContentLoaded', () => { 
    const mainBox = document.getElementById('mainBox');
    const schedule = document.getElementsByClassName('schedule');
    const sidebar = document.getElementById('sidebar');

    for (let i = 0; i < schedule.length; i++) {
        schedule[i].setAttribute('dropzone', true);
    }

    for (let i = 0; i < sidebar.children.length; i++) {
        sidebar.children[i].setAttribute('draggable', true);
    }

    mainBox.addEventListener('dragover', dragover_);
    mainBox.addEventListener('drop', dropBox_);
 
    sidebar.addEventListener('dragstart', dragstart_);


    function dragstart_(e) {       
        e.dataTransfer.setData('id', e.target.id);
        
        for (let i = 0; i < schedule.length; i++) {
            schedule[i].addEventListener('dragstart', dragstart_);
            schedule[i].addEventListener('dragover', dragover_);
            schedule[i].addEventListener('drop', drop_);
        }
    }
    
    function dragover_(e) {
        e.preventDefault();
    }

    function drop_(e) {
        e.preventDefault();

        let id = e.dataTransfer.getData('id');
        let el = getEl(id);
        
        el.setAttribute('draggable', true);
        el.style.display = 'block';
        el.style.width = "100%";
        el.style.minWidth = "100%";
        el.style.maxWidth = "100%";
        el.style.height = "100px";
        el.style.border = "none";
        el.style.borderRadius = "16px";
        el.style.fontSize = "1.5rem";
        el.style.padding = "8px";
        el.style.outline = "none";
        el.style.marginTop = "8px";
        el.style.marginBottom = "8px";

        if (id != undefined) {
            this.appendChild(el);
        }
    }

    function dropBox_(e) {
        e.preventDefault();

        let target = e.target;

        let bol = getBol(target);

        if (bol) {
            let id = e.dataTransfer.getData('id');
            let boll = true;

            if (id != undefined) {
                for (let i = 0; i < sidebar.children.length; i++) {
                    if (sidebar.children[i].id == id) {
                        boll = false;
                    }
                }

                if (boll) {
                    let el = document.getElementById(id);
                
                    el.style.display = 'none';
                    el.removeAttribute('id');
                }
            }
        }
    }

    function getBol(target) {
        let bol = true;

        for (let i = 0; i < schedule.length; i++) {
            if (schedule[i] == target) {
                bol = false;
            }
        }

        return bol;
    }

    function getEl(id){
        let el;
        let cnt = 0;

        switch (id) {
            case 'hotel':
                el = doc('textarea');
                el.setAttribute('id', id + (cnt++));
                break;
            case 'text':
                el = doc('textarea');
                el.setAttribute('id', id + (cnt++));
                break;
            case 'bus':
                el = doc('textarea');
                el.setAttribute('id', id + (cnt++));
                break;
            case 'restaurant':
                el = doc('textarea');
                el.setAttribute('id', id + (cnt++));
                break;
        }

        return el;

        function doc(el){
            return document.createElement(el);
        }
    }
});