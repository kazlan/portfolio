Meteor.methods
  sendEmail: (to, from, subject, text) -> 
    this.unblock();

    Email.send
      to: to
      from: from
      subject: subject
      text: text