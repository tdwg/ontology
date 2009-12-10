

function generateContents() {
    
    var tocDiv = document.getElementById('toc');
    var h2List = document.createElement('ul');
    var h3List = null;
    var h3List = null;
    
    
    // iterate over all the child elements of body
    var allNodes = document.getElementsByTagName('*');
    
    
    
    for (var i = 0; i < allNodes.length; i++) {
        //alert(allNodes[i].tagName);
        
        if (allNodes[i].tagName == 'H2') {
            
            buildMenuItem(allNodes[i], h2List, i);
            
            // we must have forgotten the H3 and H4 lists
            h3List = null;
            h4List = null;
        }
        
        if (allNodes[i].tagName == 'H3') {
            
            // see if we have an active h3 list
            // - if not create a new one and add it to the h2 list.
            if (h3List == null) {
                h3List = document.createElement('ul');
                
                var li = document.createElement('li');
                li.setAttribute("class", "noBullet");
                h2List.appendChild(li);
                
                li.appendChild(h3List);
            }
            
            // now add this item to the list
            buildMenuItem(allNodes[i], h3List, i);
            
            // we should forget any previous H4 lists as we are
            // starting a new H3 section
            h4List = null;
        }
        
        if (allNodes[i].tagName == 'H4') {
            
            // do nothing if we don't have an h3List
            // structure is invalid.
            if (h3List == null) continue;
            
            // see if we have an active h3 list
            // - if not create a new one and add it to the h2 list.
            if (h4List == null) {
                h4List = document.createElement('ul');
                
                var li = document.createElement('li');
                li.setAttribute("class", "noBullet");
                h3List.appendChild(li);
                
                li.appendChild(h4List);
            }
            
            // now add this item to the list
            buildMenuItem(allNodes[i], h4List, i);

        }
    }
    
    tocDiv.appendChild(h2List);
    
    //tocDiv.innerHTML = '<strong>Banana</strong> ' + allNodes.length;
}

function buildMenuItem(hNode, list, index) {
    
    // build the link
    var a = document.createElement('a');
    a.setAttribute("href", "#anchor_" + index);
    a.innerHTML = hNode.innerHTML;
    
    // add it to the list
    var li = document.createElement('li');
    li.appendChild(a);
    list.appendChild(li);
    
    // add the anchor to the destination
    var a = document.createElement('a');
    a.setAttribute("name", "anchor_" + index);
    hNode.appendChild(a);
}