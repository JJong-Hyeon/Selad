function searchPlaces() {
        var keyword = document.getElementById('keyword').value;
        var placesListEl = document.getElementById('placesList');

        // 현재의 목록을 초기화합니다.
        placesListEl.innerHTML = '';

        // 사용자가 입력한 키워드와 일치하는 매장을 찾습니다.
        var matches = placesList.filter(function(place) {
            return place.gname.includes(keyword) || place.gaaddr.includes(keyword);
        });

        if (matches.length === 0) {
            alert('일치하는 매장이 없습니다');
            return;
        }

        // 일치하는 매장을 목록에 추가합니다.
        matches.forEach(function(place) {
            var liEl = document.createElement('li');
            liEl.innerHTML = `
                <div class="info" onclick="adjustMapPosition(${place.lat}, ${place.lng},'${place.gname}')" style="cursor:pointer;">
                    <h5>${place.gname}</h5>
                    <span>${place.gaaddr}</span>
                    <span>${place.gapno}</span>
                </div>
            `;
            placesListEl.appendChild(liEl);
        });
    }