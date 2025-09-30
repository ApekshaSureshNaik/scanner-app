// To parse this JSON data, do
//
//     final eventListModel = eventListModelFromJson(jsonString);

import 'dart:convert';

EventListModel eventListModelFromJson(String str) => EventListModel.fromJson(json.decode(str));

String eventListModelToJson(EventListModel data) => json.encode(data.toJson());

class EventListModel {
  final List<Value>? values;

  EventListModel({
    this.values,
  });

  factory EventListModel.fromJson(Map<String, dynamic> json) => EventListModel(
    values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
  );
  factory EventListModel.empty() {
    return EventListModel(values: []);
  }
  Map<String, dynamic> toJson() => {
    "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
  };

}

class Value {
  final int? id;
  final String? title;
  final dynamic summary;
  final String? description;
  final int? eventTypeId;
  final dynamic participantListingId;
  final bool? isPublic;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isOnlineRegistration;
  final dynamic registrationLinkText;
  final dynamic registrationStartDate;
  final dynamic registrationEndDate;
  final int? maxParticipants;
  final dynamic eventFullText;
  final bool? isMonetary;
  final int? financialTypeId;
  final List<String>? paymentProcessor;
  final bool? isMap;
  final bool? isActive;
  final String? feeLabel;
  final bool? isShowLocation;
  final int? locBlockId;
  final int? defaultRoleId;
  final dynamic introText;
  final dynamic footerText;
  final dynamic confirmTitle;
  final dynamic confirmText;
  final dynamic confirmFooterText;
  final bool? isEmailConfirm;
  final dynamic confirmEmailText;
  final dynamic confirmFromName;
  final dynamic confirmFromEmail;
  final dynamic ccConfirm;
  final dynamic bccConfirm;
  final dynamic defaultFeeId;
  final dynamic defaultDiscountFeeId;
  final dynamic thankyouTitle;
  final dynamic thankyouText;
  final dynamic thankyouFooterText;
  final bool? isPayLater;
  final dynamic payLaterText;
  final dynamic payLaterReceipt;
  final bool? isPartialPayment;
  final dynamic initialAmountLabel;
  final dynamic initialAmountHelpText;
  final dynamic minInitialAmount;
  final bool? isMultipleRegistrations;
  final int? maxAdditionalParticipants;
  final bool? allowSameParticipantEmails;
  final bool? hasWaitlist;
  final bool? requiresApproval;
  final dynamic expirationTime;
  final bool? allowSelfcancelxfer;
  final int? selfcancelxferTime;
  final dynamic waitlistText;
  final dynamic approvalReqText;
  final bool? isTemplate;
  final dynamic templateTitle;
  final int? createdId;
  final DateTime? createdDate;
  final String? currency;
  final dynamic campaignId;
  final bool? isShare;
  final bool? isConfirmEnabled;
  final dynamic parentEventId;
  final dynamic slotLabelId;
  final dynamic dedupeRuleGroupId;
  final bool? isBillingRequired;
  final bool? isShowCalendarLinks;
  final int? eventInformationImage;
  final String? eventInformationGenre;
  final String? eventInformationEventDuration;
  final int? eventInformationBulkTicketing;
  final dynamic eventInformationAllowVolunteerRegistration;
  final String? eventInformationEventType;
  final String? eventInformationEventStyle;
  final dynamic eventInformationCallAs;
  final String? eventInformationRsvpCode;
  final String? eventInformationShareLink;
  final bool? isMemberOnlyEventIsMemberOnlyEvent;
  final bool? isPathshalaEventIsPathshalaEvent;
  final List<NameMe0>? nameMe0;

  Value({
    this.id,
    this.title,
    this.summary,
    this.description,
    this.eventTypeId,
    this.participantListingId,
    this.isPublic,
    this.startDate,
    this.endDate,
    this.isOnlineRegistration,
    this.registrationLinkText,
    this.registrationStartDate,
    this.registrationEndDate,
    this.maxParticipants,
    this.eventFullText,
    this.isMonetary,
    this.financialTypeId,
    this.paymentProcessor,
    this.isMap,
    this.isActive,
    this.feeLabel,
    this.isShowLocation,
    this.locBlockId,
    this.defaultRoleId,
    this.introText,
    this.footerText,
    this.confirmTitle,
    this.confirmText,
    this.confirmFooterText,
    this.isEmailConfirm,
    this.confirmEmailText,
    this.confirmFromName,
    this.confirmFromEmail,
    this.ccConfirm,
    this.bccConfirm,
    this.defaultFeeId,
    this.defaultDiscountFeeId,
    this.thankyouTitle,
    this.thankyouText,
    this.thankyouFooterText,
    this.isPayLater,
    this.payLaterText,
    this.payLaterReceipt,
    this.isPartialPayment,
    this.initialAmountLabel,
    this.initialAmountHelpText,
    this.minInitialAmount,
    this.isMultipleRegistrations,
    this.maxAdditionalParticipants,
    this.allowSameParticipantEmails,
    this.hasWaitlist,
    this.requiresApproval,
    this.expirationTime,
    this.allowSelfcancelxfer,
    this.selfcancelxferTime,
    this.waitlistText,
    this.approvalReqText,
    this.isTemplate,
    this.templateTitle,
    this.createdId,
    this.createdDate,
    this.currency,
    this.campaignId,
    this.isShare,
    this.isConfirmEnabled,
    this.parentEventId,
    this.slotLabelId,
    this.dedupeRuleGroupId,
    this.isBillingRequired,
    this.isShowCalendarLinks,
    this.eventInformationImage,
    this.eventInformationGenre,
    this.eventInformationEventDuration,
    this.eventInformationBulkTicketing,
    this.eventInformationAllowVolunteerRegistration,
    this.eventInformationEventType,
    this.eventInformationEventStyle,
    this.eventInformationCallAs,
    this.eventInformationRsvpCode,
    this.eventInformationShareLink,
    this.isMemberOnlyEventIsMemberOnlyEvent,
    this.isPathshalaEventIsPathshalaEvent,
    this.nameMe0,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    title: json["title"],
    summary: json["summary"],
    description: json["description"],
    eventTypeId: json["event_type_id"],
    participantListingId: json["participant_listing_id"],
    isPublic: json["is_public"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    isOnlineRegistration: json["is_online_registration"],
    registrationLinkText: json["registration_link_text"],
    registrationStartDate: json["registration_start_date"],
    registrationEndDate: json["registration_end_date"],
    maxParticipants: json["max_participants"],
    eventFullText: json["event_full_text"],
    isMonetary: json["is_monetary"],
    financialTypeId: json["financial_type_id"],
    paymentProcessor: json["payment_processor"] == null ? [] : List<String>.from(json["payment_processor"]!.map((x) => x)),
    isMap: json["is_map"],
    isActive: json["is_active"],
    feeLabel: json["fee_label"],
    isShowLocation: json["is_show_location"],
    locBlockId: json["loc_block_id"],
    defaultRoleId: json["default_role_id"],
    introText: json["intro_text"],
    footerText: json["footer_text"],
    confirmTitle: json["confirm_title"],
    confirmText: json["confirm_text"],
    confirmFooterText: json["confirm_footer_text"],
    isEmailConfirm: json["is_email_confirm"],
    confirmEmailText: json["confirm_email_text"],
    confirmFromName: json["confirm_from_name"],
    confirmFromEmail: json["confirm_from_email"],
    ccConfirm: json["cc_confirm"],
    bccConfirm: json["bcc_confirm"],
    defaultFeeId: json["default_fee_id"],
    defaultDiscountFeeId: json["default_discount_fee_id"],
    thankyouTitle: json["thankyou_title"],
    thankyouText: json["thankyou_text"],
    thankyouFooterText: json["thankyou_footer_text"],
    isPayLater: json["is_pay_later"],
    payLaterText: json["pay_later_text"],
    payLaterReceipt: json["pay_later_receipt"],
    isPartialPayment: json["is_partial_payment"],
    initialAmountLabel: json["initial_amount_label"],
    initialAmountHelpText: json["initial_amount_help_text"],
    minInitialAmount: json["min_initial_amount"],
    isMultipleRegistrations: json["is_multiple_registrations"],
    maxAdditionalParticipants: json["max_additional_participants"],
    allowSameParticipantEmails: json["allow_same_participant_emails"],
    hasWaitlist: json["has_waitlist"],
    requiresApproval: json["requires_approval"],
    expirationTime: json["expiration_time"],
    allowSelfcancelxfer: json["allow_selfcancelxfer"],
    selfcancelxferTime: json["selfcancelxfer_time"],
    waitlistText: json["waitlist_text"],
    approvalReqText: json["approval_req_text"],
    isTemplate: json["is_template"],
    templateTitle: json["template_title"],
    createdId: json["created_id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    currency: json["currency"],
    campaignId: json["campaign_id"],
    isShare: json["is_share"],
    isConfirmEnabled: json["is_confirm_enabled"],
    parentEventId: json["parent_event_id"],
    slotLabelId: json["slot_label_id"],
    dedupeRuleGroupId: json["dedupe_rule_group_id"],
    isBillingRequired: json["is_billing_required"],
    isShowCalendarLinks: json["is_show_calendar_links"],
    eventInformationImage: json["Event_Information"]?["Image"],
    eventInformationGenre: json["Event_Information.Genre"],
    eventInformationEventDuration: json["Event_Information.Event_Duration"],
    eventInformationBulkTicketing: json["Event_Information.Bulk_Ticketing"],
    eventInformationAllowVolunteerRegistration: json["Event_Information.Allow_Volunteer_Registration"],
    eventInformationEventType: json["Event_Information.Event_Type"],
    eventInformationEventStyle: json["Event_Information.Event_Style"],
    eventInformationCallAs: json["Event_Information.call_as"],
    eventInformationRsvpCode: json["Event_Information.rsvp_code"],
    eventInformationShareLink: json["Event_Information.share_link"],
    isMemberOnlyEventIsMemberOnlyEvent: json["Is_Member_Only_Event_.Is_Member_Only_Event_"],
    isPathshalaEventIsPathshalaEvent: json["Is_Pathshala_Event_.Is_Pathshala_Event_"],
    nameMe0: json["name_me_0"] == null ? [] : List<NameMe0>.from(json["name_me_0"]!.map((x) => NameMe0.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "summary": summary,
    "description": description,
    "event_type_id": eventTypeId,
    "participant_listing_id": participantListingId,
    "is_public": isPublic,
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "is_online_registration": isOnlineRegistration,
    "registration_link_text": registrationLinkText,
    "registration_start_date": registrationStartDate,
    "registration_end_date": registrationEndDate,
    "max_participants": maxParticipants,
    "event_full_text": eventFullText,
    "is_monetary": isMonetary,
    "financial_type_id": financialTypeId,
    "payment_processor": paymentProcessor == null ? [] : List<dynamic>.from(paymentProcessor!.map((x) => x)),
    "is_map": isMap,
    "is_active": isActive,
    "fee_label": feeLabel,
    "is_show_location": isShowLocation,
    "loc_block_id": locBlockId,
    "default_role_id": defaultRoleId,
    "intro_text": introText,
    "footer_text": footerText,
    "confirm_title": confirmTitle,
    "confirm_text": confirmText,
    "confirm_footer_text": confirmFooterText,
    "is_email_confirm": isEmailConfirm,
    "confirm_email_text": confirmEmailText,
    "confirm_from_name": confirmFromName,
    "confirm_from_email": confirmFromEmail,
    "cc_confirm": ccConfirm,
    "bcc_confirm": bccConfirm,
    "default_fee_id": defaultFeeId,
    "default_discount_fee_id": defaultDiscountFeeId,
    "thankyou_title": thankyouTitle,
    "thankyou_text": thankyouText,
    "thankyou_footer_text": thankyouFooterText,
    "is_pay_later": isPayLater,
    "pay_later_text": payLaterText,
    "pay_later_receipt": payLaterReceipt,
    "is_partial_payment": isPartialPayment,
    "initial_amount_label": initialAmountLabel,
    "initial_amount_help_text": initialAmountHelpText,
    "min_initial_amount": minInitialAmount,
    "is_multiple_registrations": isMultipleRegistrations,
    "max_additional_participants": maxAdditionalParticipants,
    "allow_same_participant_emails": allowSameParticipantEmails,
    "has_waitlist": hasWaitlist,
    "requires_approval": requiresApproval,
    "expiration_time": expirationTime,
    "allow_selfcancelxfer": allowSelfcancelxfer,
    "selfcancelxfer_time": selfcancelxferTime,
    "waitlist_text": waitlistText,
    "approval_req_text": approvalReqText,
    "is_template": isTemplate,
    "template_title": templateTitle,
    "created_id": createdId,
    "created_date": createdDate?.toIso8601String(),
    "currency": currency,
    "campaign_id": campaignId,
    "is_share": isShare,
    "is_confirm_enabled": isConfirmEnabled,
    "parent_event_id": parentEventId,
    "slot_label_id": slotLabelId,
    "dedupe_rule_group_id": dedupeRuleGroupId,
    "is_billing_required": isBillingRequired,
    "is_show_calendar_links": isShowCalendarLinks,
    "Event_Information.Image": eventInformationImage,
    "Event_Information.Genre": eventInformationGenre,
    "Event_Information.Event_Duration": eventInformationEventDuration,
    "Event_Information.Bulk_Ticketing": eventInformationBulkTicketing,
    "Event_Information.Allow_Volunteer_Registration": eventInformationAllowVolunteerRegistration,
    "Event_Information.Event_Type": eventInformationEventType,
    "Event_Information.Event_Style": eventInformationEventStyle,
    "Event_Information.call_as": eventInformationCallAs,
    "Event_Information.rsvp_code": eventInformationRsvpCode,
    "Event_Information.share_link": eventInformationShareLink,
    "Is_Member_Only_Event_.Is_Member_Only_Event_": isMemberOnlyEventIsMemberOnlyEvent,
    "Is_Pathshala_Event_.Is_Pathshala_Event_": isPathshalaEventIsPathshalaEvent,
    "name_me_0": nameMe0 == null ? [] : List<dynamic>.from(nameMe0!.map((x) => x.toJson())),
  };
}

class NameMe0 {
  final int? totalFee;
  final int? totalParticipants;

  NameMe0({
    this.totalFee,
    this.totalParticipants,
  });

  factory NameMe0.fromJson(Map<String, dynamic> json) => NameMe0(
    totalFee: json["total_fee"],
    totalParticipants: json["total_participants"],
  );

  Map<String, dynamic> toJson() => {
    "total_fee": totalFee,
    "total_participants": totalParticipants,
  };
}
