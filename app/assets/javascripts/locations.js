$(() => {
  bindClickHandlers();
})

const bindClickHandlers = () => {
  $('.all-locations').on('click', e => {
    e.preventDefault();
    history.pushState(null, null, 'locations');
    fetch(`/locations.json`)
      .then(response => response.json())
      .then(locations => {
        $('#app-container').html('')
        locations.forEach(location => {
          let newLocation = new Location(location);
          // console.log(newLocation)
          let locationHtml = newLocation.formatIndex();
          // console.log(locationHtml)
          $('#app-container').append(locationHtml);
        });
      });
  });

  $(document).on('click', '.show-link', function(e) {
    e.preventDefault();
    $('#app-container').html('')
    let id = $(this).attr('data-id');
    fetch(`locations/${id}.json`)
      .then(response => response.json())
      .then(location => {
        // console.log(activity)
        let newLocation = new Location(location);
        let locationHtml = newLocation.formatShow();
        $('#app-container').append(locationHtml);
      })
  })
}

// constructor function
function Location(location) {
  this.id = location.id;
  this.name = location.name;
  this.city = location.city;
  this.state = location.state;
  this.zip_code = location.zip_code;
  this.location_activities = location.location_activities;
  this.locations = location.locations;
}

// methods on the prototype
Location.prototype.formatIndex = function() {
  let locationHtml = `
    <ul>
      <a href='/locations/${this.id}' data-id='${this.id}' class='show-link'><li>${this.name}</li></a> - ${this.city}
    </ul>
  `
  return locationHtml;
}

Location.prototype.formatShow = function() {
  let locationHtml = `
    <button class='next-location'>Next</button>
    <h3>${this.name}</h3>
    <p>City: ${this.city}</p>
    <p>State: ${this.state}</p>
    <p>Zip Code: ${this.zip_code}</p>
    <p><strong>Activities in this location:</strong></p>
    <p>${this.activities}</p>
  `
  return locationHtml;
}
