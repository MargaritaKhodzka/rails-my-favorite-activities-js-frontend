$(() => {
  bindClickHandlers();
})

const bindClickHandlers = () => {
  $('.all_activities').on('click', e => {
    e.preventDefault();
    history.pushState(null, null, 'activities');
    fetch(`/activities.json`)
      .then(response => response.json())
      .then(activities => {
        $('#container').html('')
        activities.forEach(activity => {
          let newActivity = new Activity(activity);
          // console.log(newActivity)
          let activityHtml = newActivity.formatIndex();
          // console.log(activityHtml)
          $('#container').append(activityHtml);
        });
      });
  });

  $(document).on('click', '.show_link', function(e) {
    e.preventDefault();
    $('#container').html('')
    let id = $(this).attr('data-id');
    fetch(`activities/${id}.json`)
      .then(response => response.json())
      .then(activity => {
        // console.log(activity)
        let newActivity = new Activity(activity);
        let activityHtml = newActivity.formatShow();
        $('#container').append(activityHtml);
      })
  })
}

// constructor function
function Activity(activity) {
  this.id = activity.id;
  this.name = activity.name;
  this.user_id = activity.user_id;
  this.location_activity = activity.location_activities;
  this.locations = activity.locations;
}

// methods on the prototype
Activity.prototype.formatIndex = function() {
  let activityHtml = `
    <ul>
      <a href='/activities/${this.id}' data-id='${this.id}' class='show_link'><li>${this.name}</li></a>
    </ul>
  `
  return activityHtml;
}

Activity.prototype.formatShow = function() {
  let activityHtml = `
    <h3>${this.name}</h3>
    <p>${this.location_activities}</p>
  `
  return activityHtml;
}
