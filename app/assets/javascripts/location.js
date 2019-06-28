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
        // console.log(location)
        let newLocation = new Location(location);
        let locationHtml = newLocation.formatShow();
        $('#app-container').append(locationHtml);
      })
  })

  $('#new-location').on('submit', function(e) {
    e.preventDefault();
    // console.log('submitting new location')
    const values = $(this).serialize();
    $.post('/locations', values)
      .done(function(data) {
        // console.log(data)
        $('#app-container').html('')
        const newLocation = new Location(data)
        const htmlToAdd = newLocation.formatShow()
        $('#app-container').html(htmlToAdd)
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
  this.activities = location.activities;
}

// methods on the prototype
Location.prototype.formatIndex = function() {
  let locationHtml = `
    <a href='/locations/${this.id}' data-id='${this.id}' class='show-link'>
    <h5>${this.name} - ${this.city}</h5></a>
  `
  return locationHtml;
}

Location.prototype.formatShow = function() {
  let locationHtml = `
    <a href= '/locations/'>Back to locations</a>
    <h3>${this.name}</h3>
    <p><b>City:</b> ${this.city}</p>
    <p><b>State:</b> ${this.state}</p>
    <p><b>Zip Code:</b> ${this.zip_code ? this.zip_code : ''}</p>
    <p><strong>Activities in this location:</strong></p>
    <p>${this.activities}</p>
  `
  return locationHtml;
}
