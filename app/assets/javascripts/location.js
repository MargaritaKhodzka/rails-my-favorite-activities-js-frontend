$(() => {
  bindClickHandlers();
})

const bindClickHandlers = () => {
  $('.all-locations').on('click', e => {
    e.preventDefault();
    history.pushState(null, null, 'locations');
    getLocations();
  });

  const getLocations = () => {
    fetch(`/locations.json`)
    .then(response => response.json())
    .then(locations => {
      $('#app-container').html('')
      locations.forEach(location => {
        let newLocation = new Location(location);
        let locationHtml = newLocation.formatIndex();
        $('#app-container').append(locationHtml);
      });
    });
  }

  $(document).on('click', '.show-link', function(e) {
    e.preventDefault();
    let id = $(this).attr('data-id');
    fetch(`locations/${id}.json`)
      .then(response => response.json())
      .then(location => {
        $('#app-container').html('')
        let newLocation = new Location(location);
        let locationHtml = newLocation.formatShow();
        $('#app-container').append(locationHtml);
      })
  })

  $('#new-location').on('submit', function(e) {
    e.preventDefault();
    const values = $(this).serialize();
    $.post('/locations', values)
      .done(location => {
        $('#app-container').html('')
        const newLocation = new Location(location)
        const htmlToAdd = newLocation.formatShow()
        $('#app-container').html(htmlToAdd)
      })
  })
}


class Location {
  constructor(location) {
    this.id = location.id;
    this.name = location.name;
    this.city = location.city;
    this.state = location.state;
    this.zip_code = location.zip_code;
    this.location_activities = location.location_activities;
    this.activities = location.activities;
  }

  formatIndex() {
    let locationHtml = `
      <ul>
        <li><a href='/locations/${this.id}' data-id='${this.id}' class='show-link'>
        <h5>${this.name} - ${this.city}</h5></a></li>
      </ul>
    `
    return locationHtml;
  }

  formatShow() {
    let activitiesHtml = ``
    if (this.activities == false) {
      activitiesHtml += `No activities in this location yet.`;
    } else {
      this.activities.forEach(activity => {
        activitiesHtml += `<li>${activity.name}</li>`;
      });
    }

    let locationHtml = `
      <h3>${this.name}</h3>
      <p><b>City:</b> ${this.city}</p>
      <p><b>State:</b> ${this.state}</p>
      <p><b>Zip Code:</b> ${this.zip_code ? this.zip_code : ''}</p>
      <p><strong>Activities in this location:</strong></p>
      ${activitiesHtml}
    `
    return locationHtml;
  }
}
