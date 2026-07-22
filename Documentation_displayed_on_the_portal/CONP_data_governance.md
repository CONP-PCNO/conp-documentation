# Sharing Data on the CONP Portal — Information for Data Contributors

*This serves as a practical guide, answering questions that researchers and research-ethics committees most often ask before depositing data on the [Canadian Open Neuroscience Platform (CONP) Portal](https://portal.conp.ca/index).*

> Last reviewed: 2026-07-21. Policies evolve; always confirm current requirements on the [Share page](https://portal.conp.ca/share), the [FAQ](https://portal.conp.ca/faq), and the [Terms of Use](https://portal.conp.ca/index) before depositing. For case-specific guidance, use the CONP [“Contact Us” page](https://portal.conp.ca/contact_us).

On this page: [At a glance](#glance) · [1. Access tiers](#s1) · [2. Authorization & sanctions](#s2) · [3. Deposit agreement & responsibilities](#s3) · [4. Upload conditions](#s4) · [5. Ethics Toolkit](#s5) · [6. How to upload](#s6) · [7. Quick answers](#s7) · [Sources](#sources)

## <a name="glance">At a glance — the CONP governance model in one paragraph</a>

Some of the CONP’s neuroscience data are shared in full open access and it replaces the traditional combination of an access committee plus a signed data-transfer agreement with a *pre-ingestion* model that emphasizes rigorous informed consent, robust de-identification, an ethics attestation at upload, and machine-readable ethics metadata that travels with the dataset. In other words, the safeguards are applied *before* data are published, rather than through case-by-case approval of each download afterward. This approach is documented in the platform’s governance paper, Bernier et al., *“Open Data Governance at the Canadian Open Neuroscience Platform (CONP): From the Walled Garden to the Arboretum,”* *GigaScience* 13 (2024), giad114, <https://doi.org/10.1093/gigascience/giad114>.

## <a name="s1">1. Access levels: what tiers exist and which applies to your data</a>

The CONP Portal displays datasets held under more than one access model, but the tier available to *you* depends on where the data are hosted:

| Access tier           | What it means                                                                                                       | Available for data you deposit?                                                                              |
| --------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **Open access**       | Anyone can find and download the data; no application, no account. The user only accepts the Portal *Terms of Use*. | Yes — this is the only tier for data hosted natively on the CONP’s “Community Server.”                   |
| **Registered access** | Discoverable through the Portal; download requires an account on the host repository (e.g., LORIS, Brain-CODE).     | Only via an external repository that you control; the host repository governs access.                    |
| **Controlled access** | Access granted case-by-case by the host repository’s data access committee.                                         | Only via an external repository; The CONP Portal indexes/links it but does not run the access committee. |

**Key point for ethics committees:** for data hosted directly on CONP infrastructure, open access is currently the only option. The CONP does not presently operate a controlled-, restricted-, or embargoed-access tier for natively hosted data. If your dataset is not suitable for full open release, you can still make it discoverable through the CONP while keeping it in controlled or registered access on an external repository you govern (e.g., a LORIS instance, OSF, or Zenodo). In that case, the host repository’s access rules, agreements, and sanctions apply.

> Because CONP-hosted data are fully open, there is no authorization or application process for *downloaders* to complete, and therefore no per-user approval step. The corollary is that the responsibility for protecting participants shifts almost entirely to the deposit stage (consent, de-identification, attestation) — see sections 3 to 6.

## <a name="s2">2. Authorization process and sanctions for misuse</a>

**Authorization to download open CONP data.** None beyond accepting the Portal’s [Terms of Use](https://portal.conp.ca/index), which every user must accept before browsing. By accepting, the user agrees, among other things, to:
- hold any required ethics or other approvals prior to and throughout their use of the data,
- respect use restrictions and use conditions applicable to the data, including those that arise from ethics approvals and local legal requirements,
- not attempt to re-identify or re-contact individual participants,
- not assert intellectual-property rights that would impede others’ access,
- cite the resource and respect its licence, and
- contact the dataset creator immediately if it becomes apparent that data contain direct identifiers (e.g., research participant name, home address, SSN, etc.).

**Sanctions / consequences for misuse.** The CONP governance model relies primarily on (a) communicating and mitigating risk *before* publication and (b) the binding Terms of Use rather than enforcement through a data access committee. Specifically:
- Breaches of the Terms of Use can lead to restrictions on further access to CONP data or infrastructure.
- Because data are de-identified before release and cannot generally be withdrawn once shared, the practical safeguard against participant harm is risk communication and minimization at the source (i.e., de-identification and consent).
- Prohibited acts performed through the CONP infrastructure may lead to (i) civil proceedings to obtain damages, compel specific performance of obligations, or obtain an injunction; and/or (ii) the communication of observed conduct to data contributors and/or to relevant regulatory authorities.

The CONP enforces through its Terms of Use and applicable law, not through a graduated penalty matrix administered by a data access committee. Where stronger downstream enforcement is needed for a sensitive dataset, the appropriate route is controlled or registered access on an external repository (section 1).

## <a name="s3">3. Is there a data deposition / data-transfer agreement? Who is responsible for what?</a>

There is no separately negotiated, inter-institutional data contribution agreement (DCA) for depositing open data on CONP-hosted infrastructure. Instead of a bilateral contract negotiated and signed by institutional signatories, the CONP Portal uses a “click-wrap” upload attestation combined with user-facing Terms of Use and ethics provenance metadata. The relevant instruments are:

1. The data-upload attestation (completed during data submission), in which the contributor attests that one of four acceptable conditions for upload is satisfied (see section 4), specifies the open licence applied, states the tier of data release, and (where an REB approved the collection and deposit of the original data) records the REB approval number.
2. The Portal Terms of Use (binding on every user/downloader).
3. The DATS.json ethics/ethico-legal metadata that accompanies the dataset and travels with it on download.

**Allocation of responsibilities (open, CONP-hosted deposit):**

| Party                                                                 | Responsibility                                                                                                                                                                                                                                                                                                                                                                                            |
| --------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Principal Investigator / data contributor** (and their institution) | Warrants that valid legal authority exists to deposit (consent, REB/IRB waiver, enabling local law, or non-human data), ensures de-identification to a low residual risk of re-identification per the CONP Privacy & De-Identification Guide, applies an appropriate open licence, provides accurate DATS metadata and (if applicable) the REB approval number, holds responsibility for the lawfulness of the deposit. |
| **The originating institution / hospital and any commercial partner** | Their respective rights, IP, and obligations are governed by the agreements among those parties and with the PI (institutional research agreements, sponsored-research or service contracts). The CONP is not a party to those upstream agreements and does not arbitrate them; the PI must ensure they permit open deposit before uploading.                                                     |
| **CONP / McGill Centre for Integrative Neuroscience (MCIN)**          | Makes the data discoverable and downloadable, maintains harmonized metadata and provenance information, operates the Portal according to its Terms of Use and Privacy Policy, supplies the Ethics Toolkit and *ad hoc* guidance via the Ethics & Data Governance Committee.                    |
| **Downstream users**                                                  | Bound by the *Terms of Use* (no re-identification, cite, respect licence, obtain own approvals, etc.).                                                                                                                                                                                                                                                                                                    |

> If your ethics committee specifically requires a signed deposition/transfer agreement naming the institution or commercial partner, the PI, and the CONP, at the moment, that document does not exist as a standard CONP instrument because the CONP’s open-hosting model intentionally replaces it with the attestation + Terms of Use described above.
>
> Three practical paths:
>
> 1. present the Terms of Use, the upload attestation, and the Ethics Toolkit as relevant contextualizing information,
> 2. if a formal bilateral agreement is necessary, [contact the CONP](https://portal.conp.ca/contact_us) to discuss the potential to establish one,
> 3. host the dataset in controlled/registered access on an external repository whose data contribution framework meets your committee’s needs while still being discoverable through the CONP Portal.

## <a name="s4">4. The four acceptable conditions for uploading data</a>

At upload you must attest that at least one of the following is true:

1. Participants gave valid informed consent to the de-identification and deposit of their data in an open-access portal.
2. A waiver of the informed consent requirement or equivalent authorization to deposit the de-identified data in an open-access portal was obtained from a research ethics body (REB / IRB / REC).
3. Local law or a relevant institutional authorization otherwise permits depositing the data in an open-access portal.
4. The data are not derived from human participants (e.g., animal model data).

You must also (i) specify the open intellectual-property licence applied to the data, (ii) declare the access tier (for native hosting, open access), and (iii) where an REB granted an ethics approval, provide the REB approval number as evidence of ethics review.

## <a name="s5">5. The CONP Ethics Toolkit — what you need to prepare</a>

For data hosted natively on CONP’s Community Server, adherence to the Ethics Toolkit is **required**. For data merely indexed from an external repository, following it is *recommended* but the host repository’s standards govern. The Toolkit has two parts:

**A. The CONP Consent Guide** helps you decide whether existing consent supports open deposit and how to draft new consent, either for reconsenting purposes or for fresh data collection. It contains a list of Core Consent Elements, a retrospective consent filter (self-assessment of whether your existing ICF already covers open sharing), and template consent clauses you can adapt to local requirements. The six Core Consent Elements are:

1. Generation of participant data for research purposes.
2. De-identification of the data (coding, anonymization, or synthetic-data generation).
3. Sharing of de-identified data via the CONP Portal, an open-access platform accessible worldwide.
4. De-identified data may be used for commercial purposes.
5. It is not possible to withdraw data once they have been shared.
6. There remains a low residual risk of re-identification in the future.

**B. The CONP Privacy & De-Identification Guide** requires you to reduce re-identification risk to a low residual likelihood before deposit, and links to neuroscience-specific tools (e.g., removing names/birthdates from file headers, defacing/skull-stripping to remove facial features from MR images, synthetic-data generation, and methods to judge whether data belong in open vs. registered vs. controlled access).

> **Note:** skull-stripping/defacing addresses *facial* re-identification, but it is not by itself sufficient de-identification. Confirm that file headers, scan metadata, dates, rare-diagnosis combinations, and any linked clinical fields are also handled per the Privacy & De-Identification Guide, and that your consent (or REB waiver) covers open, worldwide, potentially commercial reuse that cannot be withdrawn — the most common gaps committees flag.

## <a name="s6">6. How to upload a dataset</a>

A dataset can be contributed in any of these ways (see the Portal’s [Share page](https://portal.conp.ca/share) for step-by-step instructions):
- Zenodo: tag your dataset with the keyword `canadian-open-neuroscience-platform`
- Open Science Framework (OSF): tag with `canadian-open-neuroscience-platform` and set the dataset to Public.
- CONP Community Server / DataLad: host directly within CONP infrastructure.

Each dataset must include a valid `DATS.json` metadata descriptor (derived from schema.org). The Portal provides a DATS GUI editor to help you create it. A subset of these metadata records the conditions of use and the ethics attestations described above.

## <a name="s7">7. Quick answers to the two questions ethics committees ask most</a>

**“Which access level applies and what is the authorization/sanctions process?”**

For data hosted natively on CONP infrastructure, the access level is open access (the only native tier). There is no per-download authorization and users simply accept the Terms of Use. Data use is governed by those Terms of Use and applicable law, and prohibitions on continued access and civil proceedings may result from breaches thereof. If you need controlled access and formal sanctions, host in registered access or controlled access on an external repository and index the data through the CONP.

**“Provide the data deposition/transfer agreement and the responsibilities of each party.”**

For open CONP-hosted deposits, there is no separate signed DCA. The governing instruments are the upload attestation, the Terms of Use, and the DATS ethics metadata. The PI/institution warrants lawful, consented, de-identified deposit. Upstream agreements among the hospital, any commercial partner, and the PI govern ownership/IP and must permit open deposit (CONP is not a party to them). If your committee requires a signed bilateral agreement, use the [Contact Us page](https://portal.conp.ca/contact_us) or use an external controlled-access repository.

## <a name="sources">Sources</a>
- CONP Portal — Home & Terms of Use & Privacy Policy: <https://portal.conp.ca/index>
- CONP Portal — FAQ: <https://portal.conp.ca/faq>
- CONP Portal — Share / upload instructions: <https://portal.conp.ca/share>
- Bernier A., Knoppers B.M., Bermudez P., Beauvais M.J.S., Thorogood A., CONP Consortium, Evans A. *Open Data Governance at the Canadian Open Neuroscience Platform (CONP): From the Walled Garden to the Arboretum.* GigaScience 13 (2024), giad114. <https://doi.org/10.1093/gigascience/giad114>
- CONP Ethics & Data Governance Framework / Ethics Toolkit: <https://conp.ca/ethics-governance/>
