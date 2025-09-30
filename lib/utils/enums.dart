enum UserRole {
  subscriber,
  event_manager,
  civicrm_admin,
  treasurer,
  cash_collector
}

UserRole? userRoleFromString(String role) {
  switch (role.toLowerCase()) {
    case 'subscriber':
      return UserRole.subscriber;
    case 'event_manager':
      return UserRole.event_manager;
    case 'civicrm_admin':
      return UserRole.civicrm_admin;
    case 'treasurer':
      return UserRole.treasurer;
    case 'cash_collector':
      return UserRole.cash_collector;
    default:
      return null;
  }
}

enum AppMenuItem {
  dashboard,
  profile,
  events,
  pathashala,
  eventBooli,
  donations,
  contributions,
  help,
  membership,
  family,
  signOut,
  pledges,
  appsCalendar,
  contact,
  contactList,
  contactCommunicate,
  contactSummaryReport,
  manageEvents,
  liveEvents,
  pastEvents,
  upcomingEvents,
  participants,
  verifyParticipants,
  eventCommunicate,
  eventsSummaryReport,
  eventsParticipantsSummaryReport,
  eventsFinancialReport,
  managePathashala,
  livePathashala,
  pastPathashala,
  upcomingPathashala,
  pathashalaParticipants,
  verifyPathashalaParticipants,
  pathashalaCommunicate,
  pathashalaSummaryReport,
  pathashalaParticipantsSummaryReport,
  pathashalaFinancialReport,
  manageDonations,
  verifyDonations,
  donationList,
  manageDonationCategory,
  donationCommunicate,
  donationSummaryReport,
  donationFinancialReport,
  userPledges,
  managePledges,
  managePledgeCategory,
  pledgesSummaryReport,
  pledgesFinancialReport,
  newApplication,
  approveFirstLevel,
  membershipList,
  pastMembersList,
  rejectedMembersList,
  maturedMembers,
  manageMembershipTypes,
  membershipCommunicate,
  membershipSummaryReport,
  membershipFinancialReport,
  report,
  cashCollectionReport,
  familyContributions,
  automatedMails,
  settings,
  roleSettings,
  registrationForm,
}
extension AppMenuItemPath on AppMenuItem {
  String get path {
    switch (this) {
      case AppMenuItem.dashboard: return "/dashboard";
      case AppMenuItem.profile: return "/profile";
      case AppMenuItem.events: return "/events";
      case AppMenuItem.pathashala: return "/pathashala";
      case AppMenuItem.eventBooli: return "/event-booli";
      case AppMenuItem.donations: return "/donations";
      case AppMenuItem.contributions: return "/contributions";
      case AppMenuItem.help: return "/help";
      case AppMenuItem.membership: return "/membership";
      case AppMenuItem.family: return "/family";
      case AppMenuItem.signOut: return "/sign-out";
      case AppMenuItem.pledges: return "/pledges";
      case AppMenuItem.appsCalendar: return "/apps/calendar";
      case AppMenuItem.contact: return "/contact";
      case AppMenuItem.contactList: return "/contact-list";
      case AppMenuItem.contactCommunicate: return "/contact/contact-communicate";
      case AppMenuItem.contactSummaryReport: return "/contact/contact-summary-report";
      case AppMenuItem.manageEvents: return "/events/manage-events";
      case AppMenuItem.liveEvents: return "/events/live-events";
      case AppMenuItem.pastEvents: return "/events/past-events";
      case AppMenuItem.upcomingEvents: return "/events/upcoming-events";
      case AppMenuItem.participants: return "/events/participants";
      case AppMenuItem.verifyParticipants: return "/events/verify-participants";
      case AppMenuItem.eventCommunicate: return "/events/event-communicate";
      case AppMenuItem.eventsSummaryReport: return "/events/events-summary-report";
      case AppMenuItem.eventsParticipantsSummaryReport: return "/events/events-participants-summary-report";
      case AppMenuItem.eventsFinancialReport: return "/events/events-financial-report";
      case AppMenuItem.managePathashala: return "/pathashala/manage-pathashala";
      case AppMenuItem.livePathashala: return "/pathashala/live-pathashala";
      case AppMenuItem.pastPathashala: return "/pathashala/past-pathashala";
      case AppMenuItem.upcomingPathashala: return "/pathashala/upcoming-pathashala";
      case AppMenuItem.pathashalaParticipants: return "/pathashala/pathashala-participants";
      case AppMenuItem.verifyPathashalaParticipants: return "/pathashala/verify-pathashala-participants";
      case AppMenuItem.pathashalaCommunicate: return "/pathashala/pathashala-communicate";
      case AppMenuItem.pathashalaSummaryReport: return "/pathashala/pathashala-summary-report";
      case AppMenuItem.pathashalaParticipantsSummaryReport: return "/pathashala/pathashala-participants-summary-report";
      case AppMenuItem.pathashalaFinancialReport: return "/pathashala/pathashala-financial-report";
      case AppMenuItem.manageDonations: return "/donations/manage-donations";
      case AppMenuItem.verifyDonations: return "/donations/verify-donations";
      case AppMenuItem.donationList: return "/donations/donation-list";
      case AppMenuItem.manageDonationCategory: return "/donations/manage-donation-category";
      case AppMenuItem.donationCommunicate: return "/donations/donation-communicate";
      case AppMenuItem.donationSummaryReport: return "/donations/donation-summary-report";
      case AppMenuItem.donationFinancialReport: return "/donations/donation-financial-report";
      case AppMenuItem.userPledges: return "/pledges/user-pledges";
      case AppMenuItem.managePledges: return "/pledges/manage-pledges";
      case AppMenuItem.managePledgeCategory: return "/pledge/manage-pledge-category";
      case AppMenuItem.pledgesSummaryReport: return "/pledges/pledges-summary-report";
      case AppMenuItem.pledgesFinancialReport: return "/pledges/pledges-financial-report";
      case AppMenuItem.newApplication: return "/membership/new-application";
      case AppMenuItem.approveFirstLevel: return "/membership/approve-first-level";
      case AppMenuItem.membershipList: return "/membership/membership-list";
      case AppMenuItem.pastMembersList: return "/membership/past-members-list";
      case AppMenuItem.rejectedMembersList: return "/membership/rejected-members-list";
      case AppMenuItem.maturedMembers: return "/membership/matured-members";
      case AppMenuItem.manageMembershipTypes: return "/membership/manage-membership-types";
      case AppMenuItem.membershipCommunicate: return "/membership/membership-communicate";
      case AppMenuItem.membershipSummaryReport: return "/membership/membership-summary-report";
      case AppMenuItem.membershipFinancialReport: return "/membership/membership-financial-report";
      case AppMenuItem.report: return "/report";
      case AppMenuItem.cashCollectionReport: return "/report/cash-collection-report";
      case AppMenuItem.familyContributions: return "/report/family-contributions";
      case AppMenuItem.automatedMails: return "/mails/automated-mails";
      case AppMenuItem.settings: return "/settings";
      case AppMenuItem.roleSettings: return "/settings/role-settings";
      case AppMenuItem.registrationForm: return "/settings/registration-from";
    }
  }
}


