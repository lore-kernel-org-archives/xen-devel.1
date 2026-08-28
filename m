Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25385C61DC6
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 08:52:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401779.1637304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzsJv-0002Bi-CR; Fri, 28 Aug 2026 08:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401779.1637304; Fri, 28 Aug 2026 08:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzsJv-0002Ba-9X; Fri, 28 Aug 2026 08:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1401779;
 Fri, 28 Aug 2026 08:52:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a04791cd47000c4f3@swg.vates.tech>)
 id 1wzsJt-0002BA-Kj
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:52:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzsJs-00BpWI-U7
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 10:52:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a04791cd47000c4f3@swg.vates.tech>)
 id 6a914c3b-bab6-0a2a0a5309dd-0a2a45058e36-14
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:52:16 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a04791cd47000c4f3@swg.vates.tech>)
 id 6a914c40-4cb1-0a2a45050019-b9ff1c1298b1-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:52:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a04791cd47000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 28 Aug 2026 08:52:12 +0000
Received: from [192.168.1.97] (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id D4EAE81F88;
 Fri, 28 Aug 2026 10:52:11 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=WG05nOY/WBj9LoaLnrpdbudf0fRc6mLlCln1H7xPj5M=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=AVCbyeYeM5jFLpv9f3vjxbFycGgK2gCGDcXpBPYeMc78YtbsdOWqmkLZhDbrvYSCkXyiCoFgJ
 mLS8kpRu1n70Q5QVS0aqV0byGb3YL/3UhSRERXF6nm5xRbQstA3/miizKsZ8FGiOK4Go+jccAdj
 NH1uqPb7g82edNRW7gAjv5WK819W6U8hCyOd2pZuViXeZB65m2qXsIr7T7mLnpsCS21Q2sdVMJV
 O0g1PlMbENdJjZ66ZC9A2PYSJ2JAs/KqSeJtSD0J2niUNVOyFlGRCseI4e0gxmY+WjErmh0nbJv
 2yozQ6PbFHZ+syBVilqDbM8wbUyxZtftjYCH3NtQ/Q5A==
X-Zone-Loop: aa142bd06864d34e793039b54c03efb1df2657447d04
x-campaign-type: default
x-transaction-id: 4c918e87-1738-41de-ac79-fd8ca76d4860
x-swg-uid: 01-2e3ed1fa-a2f9-4dbe-bf91-d139b63930e1
X-Mailer: Sweego
Message-ID:
 <1787907132.8631fc262581453bbf619ec5b2062170.1a04791cd47000c4f3@vates.tech>
x-swg-bid: 1787907132.8631fc262581453bbf619ec5b2062170.1a04791cd47000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 28 Aug 2026 10:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] hvm/ioreq: Negotiate extended destination ID
 support per ioreq server
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@vates.tech>
 <a9510f21-b7a8-4323-a64d-0f33e44cd8b0@suse.com>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <a9510f21-b7a8-4323-a64d-0f33e44cd8b0@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2e0b.a407e214bb689b6.1a04791cb12.2ded673d79bf949=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787907132178
X-purgate-ID: tlsNG-c201ff/1787907136-F62AB2A1-63EB85A8/0/0
X-purgate-type: clean
X-purgate-size: 15171

---=Part.2e0b.a407e214bb689b6.1a04791cb12.2ded673d79bf949=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/19/26 16:38, Jan Beulich wrote:
> On 27=2E04=2E2026 15:54, Julian Vetter wrote:
>> ---
>> Changes in v4:
>> - As suggested by Roger, replaced XEN_DMOP_enable_ext_dest_id (v3 patch
>>    6), a separate DM op the device model had to call before starting
>>    vCPUs, with a flags byte repurposed from the existing pad[3] field o=
f
>>    xen_dm_op_create_ioreq_server
>=20
> IOW the presence of XEN_DMOP_enable_ext_dest_id in the earlier patch is
> entirely stale?
>=20
>> - New XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID flag (bit 0) lets each ioreq
>>    server signal support at registration time
>> - As suggested by Roger level the feature across all ioreq servers=2E
>>    XEN_HVM_CPUID_EXT_DEST_ID is only advertised when every server
>>    registered before arch_domain_creation_finished() sets the flag=2E A
>>    single server without the flag suppresses the feature for the whole
>>    domain!
>> - Lock the levelled result at domain creation time and enforce it for
>>    servers registered afterwards, preventing a late opt-out from breaki=
ng
>>    guests that already see the feature in CPUID
>> - Persist the locked flag via HVM_SAVE_TYPE(EXT_DEST_ID) so that live
>>    migration preserves the guest-visible CPUID bit independently of whe=
n
>>    the device model registers its ioreq servers on the destination host
>=20
> So a new save record for a single bit=2E That doesn't look very efficien=
t
> to me=2E
>=20
>> @@ -1106,7 +1107,16 @@ int arch_domain_soft_reset(struct domain *d)
>>   void arch_domain_creation_finished(struct domain *d)
>>   {
>>       if ( is_hvm_domain(d) )
>> +    {
>> +        /*
>> +         * Lock the extended destination ID state=2E OR preserves any =
value
>> +         * already restored from an HVM save record (migration path)=
=2E For a
>> +         * fresh domain, ext_dest_id starts false and the dynamic chec=
k
>> +         * supplies the levelled result across all registered ioreq se=
rvers=2E
>> +         */
>> +        d->arch=2Ehvm=2Eext_dest_id |=3D hvm_ext_dest_id_enabled(d);
>=20
> For an unaware guest, after migration it'll suddenly get the flag set
> if all servers are capable=2E That can't be right=2E It looks pretty muc=
h
> unavoidable for the field to become tristate (unset / false / true)=2E

Thank you Jan=2E You're right true/false is not enough, but there's one=20
migration case left where even a tristate doesn't give a clear answer, I=
=20
believe and I'd like your opinion on that=2E

Scenario: a domain is migrated (or saved/restored) from a Xen that=20
predates this series, onto a new Xen where every registered ioreq server=
=20
has XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID set=2E

So, the incoming stream would not carry a EXT_DEST_ID record, so=20
ext_dest_id_load() never runs and the field would still be=20
EXT_DEST_ID_UNSET when arch_domain_creation_finished() runs on the=20
destination=2E The latch then takes the "fresh domain" path and recomputes=
=20
the levelled value, which here comes out ENABLED=2E

 From that point Xen would interpret the extended destination ID bits=20
for this guest=2E But before the guest ran under a Xen that never=20
advertised XEN_HVM_CPUID_EXT_DEST_ID, so it never used those reserved=20
bits deliberately, but might have written garbage into them accidentaly=2E

I see two ways to handle this:

1=2E Accept it=2E Document that migrating in from a pre-feature Xen onto a=
n=20
all-opted-in host may turn the feature on, and might now treat non-zero=20
reserved bits as extended destionation ID bits=2E
2=2E Distinguish "fresh domain" from "restored without the record" and=20
force the latter to DISABLED=2E A feature-aware guest then picks the=20
feature up on its next reboot on the new host, which matches how every=20
other creation-time-levelled property behaves=2E

The stream is parsed by Xen (the toolstack hands the HVM-context blob to=
=20
XEN_DOMCTL_sethvmcontext -> hvm_load()), so this stays entirely in the=20
hypervisor: add a 'bool context_loaded' to 'struct hvm_domain', set it=20
in the hvm_load(), and in the latch do

if ( d->arch=2Ehvm=2Eext_dest_id =3D=3D EXT_DEST_ID_UNSET )
      d->arch=2Ehvm=2Eext_dest_id =3D
         (!d->arch=2Ehvm=2Econtext_loaded && hvm_ext_dest_id_enabled(d))
         ? EXT_DEST_ID_ENABLED : EXT_DEST_ID_DISABLED;

This would mean one new bool in 'struct hvm_domain' which covers both=20
live migration and xl restore of an old image=2E What do you think? Would=
=20
this be acceptable?

>=20
>>           hvm_domain_creation_finished(d);
>=20
> Blank line please between what you add and what was already there=2E
>=20
>> @@ -325,6 +326,42 @@ void arch_ioreq_domain_init(struct domain *d)
>>       register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
>>   }
>>  =20
>> +int arch_ioreq_server_create_check(const struct domain *d, uint8_t fla=
gs)
>=20
> Bogus use of a fixed-width type again=2E
>=20
>> +{
>> +    if ( !is_hvm_domain(d) || !d->creation_finished )
>> +        return 0;
>=20
> Why the HVM check? ioreq_server_dm_op(), the sole caller, will only ever
> be called for HVM domains (as per the check near the top of dm_op())=2E
>=20
>> +    if ( d->arch=2Ehvm=2Eext_dest_id &&
>> +         !(flags & XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) )
>> +        return -EPERM;
>> +
>> +    return 0;
>> +}
>> +
>> +static int cf_check ext_dest_id_save(struct vcpu *v, hvm_domain_contex=
t_t *h)
>> +{
>> +    struct hvm_hw_ext_dest_id s =3D {
>> +        =2Eenabled =3D v->domain->arch=2Ehvm=2Eext_dest_id,
>> +    };
>> +
>> +    return hvm_save_entry(EXT_DEST_ID, 0, h, &s);
>> +}
>> +
>> +static int cf_check ext_dest_id_load(struct domain *d, hvm_domain_cont=
ext_t *h)
>> +{
>> +    struct hvm_hw_ext_dest_id s;
>> +
>> +    if ( hvm_load_entry(EXT_DEST_ID, h, &s) )
>> +        return -EINVAL;
>> +
>> +    d->arch=2Ehvm=2Eext_dest_id =3D s=2Eenabled;
>=20
> Afaict this can load arbitrary values other than 0 or 1=2E In fact =2E=
=2E=2E
>=20
>> +    return 0;
>> +}
>> +
>> +HVM_REGISTER_SAVE_RESTORE(EXT_DEST_ID, ext_dest_id_save, NULL,
>> +                          ext_dest_id_load, 1, HVMSR_PER_DOM);
>=20
> =2E=2E=2E I think there's ext_dest_id_check() missing=2E
>=20
>> --- a/xen/arch/x86/hvm/vioapic=2Ec
>> +++ b/xen/arch/x86/hvm/vioapic=2Ec
>> @@ -24,6 +24,7 @@
>>    *  Ported to xen by using virtual IRQ line=2E
>>    */
>>  =20
>> +#include <xen/ioreq=2Eh>
>>   #include <xen/types=2Eh>
>>   #include <xen/mm=2Eh>
>>   #include <xen/xmalloc=2Eh>
>=20
> Is this hunk stale?
>=20
>> @@ -597,6 +598,7 @@ int vioapic_get_trigger_mode(const struct domain *d=
, unsigned int gsi)
>>   static int cf_check ioapic_check(const struct domain *d, hvm_domain_c=
ontext_t *h)
>>   {
>>       const HVM_SAVE_TYPE(IOAPIC) *s;
>> +    unsigned int i;
>=20
> Better =2E=2E=2E
>=20
>> @@ -617,6 +619,24 @@ static int cf_check ioapic_check(const struct doma=
in *d, hvm_domain_context_t *h
>>       if ( s->ioregsel > VIOAPIC_REG_RTE0 + (ARRAY_SIZE(s->redirtbl) - =
1) * 2 + 1 )
>>           return -EINVAL;
>>  =20
>> +    /*
>> +     * If any RTE uses extended destination ID bits, the EXT_DEST_ID s=
ave
>> +     * record must have been loaded first (restoring d->arch=2Ehvm=2Ee=
xt_dest_id)=2E
>> +     * The ioreq server re-registration by the DM happens later, so us=
e the
>> +     * domain-level locked flag rather than the per-server dynamic che=
ck=2E
>> +     */
>> +    for ( i =3D 0; i < ARRAY_SIZE(s->redirtbl); i++ )
>=20
> =2E=2E=2E
>=20
>      for ( unsigned int i =3D 0; i < ARRAY_SIZE(s->redirtbl); i++ )
>=20
>> +    {
>> +        if ( s->redirtbl[i]=2Efields=2Eext_dest_id && !d->arch=2Ehvm=
=2Eext_dest_id )
>> +        {
>> +            printk(XENLOG_G_ERR "HVM restore: %pd IO-APIC RTE %u has "
>> +                                "extended destination ID bits set but =
"
>> +                                "EXT_DEST_ID is not enabled\n",
>> +                                d, i);
>=20
> No, this is the wrong way round=2E As long as we permit guests to put
> non-zero in these bits, we can't demand the bits to be zero here=2E You
> need to avoid interpreting them as extended-ID when the feature isn't
> enabled for a guest=2E
>=20
>> --- a/xen/common/ioreq=2Ec
>> +++ b/xen/common/ioreq=2Ec
>> @@ -641,7 +641,7 @@ static void ioreq_server_deinit(struct ioreq_server=
 *s)
>>   }
>>  =20
>>   static int ioreq_server_create(struct domain *d, int bufioreq_handlin=
g,
>> -                               ioservid_t *id)
>> +                               uint8_t flags, ioservid_t *id)
>=20
> Inappropriate use of a fixed-width type again=2E
>=20
>> @@ -1350,11 +1352,16 @@ int ioreq_server_dm_op(struct xen_dm_op *op, st=
ruct domain *d, bool *const_op)
>>           *const_op =3D false;
>>  =20
>>           rc =3D -EINVAL;
>> -        if ( data->pad[0] || data->pad[1] || data->pad[2] )
>> +        if ( data->flags & ~XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID ||
>=20
> Parentheses please around bitwise logic being operands to boolean logic=
=2E
>=20
>> +             data->pad[0] || data->pad[1] )
>> +            break;
>> +
>> +        rc =3D arch_ioreq_server_create_check(d, data->flags);
>=20
> It's a little odd to have an arch hook here, yet at the same time an
> x86-specific check a few lines up (XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID
> really is meaningless on non-x86, and should hence either be constrained
> to x86 [with the bit position reusable for something else on other
> architectures], or be properly rejected on non-x86)=2E
>=20
>> @@ -455,6 +456,18 @@ int pt_irq_create_bind(
>>           uint64_t msi_addr;
>>           uint32_t msi_data;
>>  =20
>> +        /*
>> +         * Refuse the old MSI bind path when extended destination IDs =
are
>> +         * in use=2E The caller must use XEN_DMOP_bind_pt_msi_irq inst=
ead,
>> +         * which passes the raw MSI address so Xen can decode the exte=
nded
>> +         * bits=2E This old path only carries an 8-bit destination ID =
and
>> +         * would silently misroute interrupts to vCPUs with APIC IDs >=
 255=2E
>=20
> "to" looks ambiguous to me here=2E Maybe better "targeted at"? It's also=
 >=3D 255,
> I think=2E
>=20
>> +         */
>> +        if ( hvm_ext_dest_id_enabled(d) )
>> +        {
>> +            return -EPERM;
>> +        }
>=20
> No need for curly braces here=2E Further I think -EPERM isn't a good cho=
ice, as
> that's what xsm_default_action() returns=2E -EOPNOTSUPP may be an option=
, or
> some other, more "exotic" indicator=2E
>=20
>> --- a/xen/include/public/arch-x86/hvm/save=2Eh
>> +++ b/xen/include/public/arch-x86/hvm/save=2Eh
>> @@ -627,12 +627,27 @@ struct hvm_msr {
>>  =20
>>   #define CPU_MSR_CODE  20
>>  =20
>> +/*
>> + * HVM_SAVE_TYPE(EXT_DEST_ID): domain-level extended MSI destination I=
D state=2E
>=20
> Why MSI when the vIO-APIC uses it as well?
>=20
>> + * Records whether the extended destination ID feature was enabled for=
 this
>> + * domain at the time guest vCPUs were started=2E This allows migratio=
n to
>> + * preserve the setting across hosts without relying on the device mod=
el to
>> + * re-register its ioreq servers before the guest's first CPUID query=
=2E
>> + */
>=20
> The guest's first CPUID query surely is going to happen after at least o=
ne DM
> has registered a server? (For HVM, that is=2E No server may ever be regi=
stered
> for PVH, aiui=2E) It's not quite clear to me why this connection to CPUI=
D
> queries is being made here=2E The flag is necessary at server registrati=
on time,
> as ones not supporting the feature need to be rejected=2E
>=20
>> --- a/xen/include/public/hvm/dm_op=2Eh
>> +++ b/xen/include/public/hvm/dm_op=2Eh
>> @@ -39,18 +39,28 @@ typedef uint16_t ioservid_t;
>>    * XEN_DMOP_create_ioreq_server: Instantiate a new IOREQ Server for a
>>    *                               secondary emulator=2E
>>    *
>> - * The <id> handed back is unique for target domain=2E The valur of
>> + * The <id> handed back is unique for target domain=2E The value of
>>    * <handle_bufioreq> should be one of HVM_IOREQSRV_BUFIOREQ_* defined=
 in
>> - * hvm_op=2Eh=2E If the value is HVM_IOREQSRV_BUFIOREQ_OFF then  the b=
uffered
>> + * hvm_op=2Eh=2E If the value is HVM_IOREQSRV_BUFIOREQ_OFF then the bu=
ffered
>>    * ioreq ring will not be allocated and hence all emulation requests =
to
>>    * this server will be synchronous=2E
>> + *
>> + * If <flags> contains XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID, the server w=
ill
>> + * use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings, pass=
ing
>> + * raw MSI address/data fields so Xen can decode extended destination =
ID
>> + * bits=2E Once any server sets this flag, Xen will advertise
>> + * XEN_HVM_CPUID_EXT_DEST_ID to the guest=2E Must be set before the gu=
est
>> + * vCPUs are started=2E
>=20
> I don't understand the last sentence=2E Is it perhaps stale from how thi=
ngs
> were earlier? There's nothing to "set" here=2E
>=20
>> --- a/xen/include/xen/ioreq=2Eh
>> +++ b/xen/include/xen/ioreq=2Eh
>> @@ -54,9 +54,35 @@ struct ioreq_server {
>>       evtchn_port_t          bufioreq_evtchn;
>>       struct rangeset        *range[NR_IO_RANGE_TYPES];
>>       bool                   enabled;
>> +    bool                   ext_dest_id;
>>       uint8_t                bufioreq_handling;
>>   };
>>  =20
>> +/*
>> + * Return true if every registered ioreq server has opted in to extend=
ed
>> + * destination IDs (XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) and at least on=
e
>> + * server exists=2E
>=20
> Why is one server existing relevant?
>=20
>> A single server without the flag is enough to suppress
>> + * XEN_HVM_CPUID_EXT_DEST_ID, preventing misrouted interrupts=2E
>> + */
>> +static inline bool hvm_ext_dest_id_enabled(const struct domain *d)
>> +{
>> +    unsigned int i;
>> +    bool found =3D false;
>> +
>> +    for ( i =3D 0; i < MAX_NR_IOREQ_SERVERS; i++ )
>=20
> Please use ARRAY_SIZE() in such cases=2E
>=20
>> +    {
>> +        const struct ioreq_server *s =3D d->ioreq_server=2Eserver[i];
>> +
>> +        if ( !s )
>> +            continue;
>> +        if ( !s->ext_dest_id )
>=20
> As there's no locking here, and as the comment ahead of the function als=
o
> doesn't mention any locking requirements: What guarantees s to still be
> valid to deref here? Furthermore, what guarantees the result of this
> function to not be stale by the time the caller looks at it? (Some of
> this may be easier if this wasn't an inline function in a globally
> visible header=2E)
>=20
> Jan
>=20



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2e0b.a407e214bb689b6.1a04791cb12.2ded673d79bf949=---

