$(() => {
  bindClickHandlers();
})

const bindClickHandlers = () => {
  $('.all_activities').on('click', e => {
    e.preventDefault();
    history.pushState(null, null, 'activities')
    fetch(`/activities.json`)
      .then((response) => response.json())
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
}

// constructor function
function Activity(activity) {
  this.id = activity.id;
  this.name = activity.name;
  this.user_id = activity.user_id;
  this.location_activity = activity.location_activities;
  this.locations = activity.locations;
}

// method on the prototype
Activity.prototype.formatIndex = function() {
  let activityHtml = `
    <ul>
      <a href="/activities/${this.id}"><li>${this.name}</li></a>
    </ul>
  `
  return activityHtml;
}
