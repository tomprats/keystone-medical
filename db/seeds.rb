if Organization.count.zero?
  tomify = Organization.create(
    path: "tomify",
    name: "Tomify",
    website: "https://www.tomify.me"
  )
end

if User.count.zero?
  tomify ||= Organization.find_by(name: "Tomify")
  User.create(
    organization_id: tomify.id,
    admin: true,
    email: "tprats108@gmail.com",
    first_name: "Tom",
    last_name: "Prats",
    password: "password"
  )
end

if Page.count.zero?
  Page.create(
    active: true,
    path: "home",
    name: "Home"
  )

  Page.create(
    active: true,
    name: "Why Transparent Pricing?",
    path: "why-transparent-pricing",
    text: """# Why Transparent Pricing?

OSS Health is a physician-owned multispecialty provider of comprehensive orthopaedic and spine healthcare. Our services include inpatient and outpatient surgical services, operative and non-operative management of orthopaedic and spine problems including fractures, degenerative disease, and rheumatologic conditions, imaging services including MRI, CT, ultrasound, osteoporosis screening, and x-rays, and infusion treatments.

The physicians, physician assistants, and staff of OSS Health are dedicated to providing the highest level of quality, safety, and customer satisfaction.  Our transparent pricing initiative takes this commitment to the next level by moving our business model from simply being on the list of insurance company and hospital system “allowed providers” to one that competes for providing your care on the basis of quality and value.

Healthcare costs have spiraled out of control wreaking financial havoc on individuals and families, small and large businesses, and our government at all levels.  Absence of free market principles of individual choice, cost and quality transparency, and competition in healthcare – principles that have provided us with so much choice and innovation at ever decreasing cost in so many other aspects of our lives – has greatly contributed to that excessive cost growth.

While lowering healthcare costs is important, high quality care must come first. The physicians and staff of OSS are proud of the many certifications, acknowledgement, and awards for quality, patient safety, and patient satisfaction our hospital has earned. Please visit our awards page to see the comprehensive list.

OSS has designed and implemented multiple processes and surgical pathways to provide you the highest quality and safest surgery.  While we have achieved quality and safety surgical outcomes that equal or exceed national standards, we continually are evaluating and updating those policies and pathways to do even better.  You can look on our website and see our outcome data for yourself.

Our listed transparent bundled prices are all-inclusive including surgeon and anaesthesia fees, OR fees including any implant costs, hospital floor fees for inpatient stays, and post-operative doctors visits and x-rays.  We can offer such pricing that typically is 40 to 70% lower than the insurance networks “discounted” fees because our financial arrangement is directly with you or your employer who provides your healthcare benefit – no 3rd party-payer middleman.  We provide the requested care and you or your employer pay the agreed upon fee when the service is provided – no co-pays, deductibles, or insurance company “qualifiers”.  Elimination of these insurance administration costs allows us to provide the highest quality care at exceptional value, and also why these prices cannot be offered to or through insurance companies.

Our transparent bundled payment program offers particular savings opportunities for persons who have their healthcare benefit provided by a self-insured entity, persons with high deductibles and copays, persons participating in sharing healthcare ministries, and persons who are uninsured."""
  )

  Page.create(
    active: true,
    name: "Pricing Disclaimer",
    path: "pricing-disclaimer",
    text: """# Pricing Disclaimer

**NOTE: If you are scheduled for surgery at our facility and we are filing insurance for you, the prices listed on this website do not apply to you.**

The prices for the procedures listed on this website include the facility fee, the surgeon’s fee and the anesthesiologist’s fee. The initial consultation with the surgeon is also included, as is uncomplicated follow-up care. The duration of postoperative care is different for each surgical procedure. Therefore, your surgeon will inform you at the initial consultation the amount of postoperative care covered by the price. The $200 initial consultation fee is applied to the total cost of the procedure should surgery be indicated. If surgery is not indicated the $200 will be retained by us. Our goal is for the price to be as transparent as possible. A list of what is NOT included in the fee is as follows:

Any diagnostic studies necessary prior to the surgery such as lab, MRI, X-rays, consultations with specialists to determine medical risk/management, physical therapy and rehabilitation.
Any hardware or implants necessary for completion of the procedure (plates and screws, e.g. for orthopedic procedures). This price information will be provided prior to surgery but subsequent to the surgical consultation. Our experienced surgical staff knows with almost certainty what will be needed to complete your surgery and this hardware or implants will be provided to you at invoice cost without any markup whatsoever. Copies of the invoices will be provided to you.

Any overnight stay at our facility can be arranged on a case-by-case basis for an additional charge.  Lodging and travel expenses are not included in the price of the procedures. Expenses or fees resulting from complications subsequent to the completion of the surgery and discharge from the facility are also not included.

If the procedure you believe you require is not listed on this website, feel free to call our contact number to inquire about availability and pricing. The prices listed are not negotiable and are available only to those who pay the entire amount in advance. We are able to offer these prices due to the lack of expense in processing the claims and the absence of risk for non-payment. Alternative payment arrangements can be made with human resource departments or divisions of self-insured entities if necessary. Once again, if you are scheduled for surgery at our facility and insurance is to be filed by us, these prices listed on our website do not apply to you."""
  )
end
