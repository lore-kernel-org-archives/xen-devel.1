Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FF0C61DB9
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 14:20:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399252.1635405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wys0R-0001Bk-75; Tue, 25 Aug 2026 14:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399252.1635405; Tue, 25 Aug 2026 14:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wys0R-0001BD-1u; Tue, 25 Aug 2026 14:20:03 +0000
Received: by outflank-mailman (input) for mailman id 1399252;
 Tue, 25 Aug 2026 14:20:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3@swg.vates.tech>)
 id 1wys0O-0000rj-J9
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:20:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wys0N-0059UO-SZ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 16:19:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3@swg.vates.tech>)
 id 6a8da486-2eae-0a2a0a5409dd-0a2a450bc6c4-10
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:19:59 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3@swg.vates.tech>)
 id 6a8da48f-b7e8-0a2a450b0019-b9ff1c22a7c5-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:19:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0394ac7f2000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 25 Aug 2026 14:19:57 +0000
Received: from [192.168.1.49] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8CC7C83274;
 Tue, 25 Aug 2026 16:19:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=u97rfPbz3xsGMVtDrfGCIiKOaJT5M7k/QkRGG3lW9Cw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Z54AI6zvRbFBmcgsqeJwSntWmfsvCMZOiQlZ6dlSXt8/mKx5hbutCxpkCHw9YYpV1olD8oIf2
 eVFSp4MewhdAvnSPRFP6no65blD5OvFOnFD7/IpkTykswBkNYyJx7sbBRQMBn31NTo4dGSEvG7i
 skMuW/UezwzS/Y4pVsap2UxuWC2ufk8C+RE9CAFqJwEJ7hW2hqN2egMqbP+i1dywFBXC/BNfoDe
 hualPjI/5HJ8zJJfeNQJNk3VndngLIoMUeEez1Rs5/CAwDrUWuUESa1HDBufC6D41BbZvO8vdbE
 VO/IKU+zeUkZvDFICNFtalap0RlOuDk4YPCGrbaO/2yQ==
X-Zone-Loop: b659c29a28e08754c13d90a6aa320db24d834af98647
x-campaign-type: default
x-transaction-id: 90d8b0ea-8456-4b4e-ba01-6d8445466996
x-swg-uid: 01-4602cf69-b639-4b74-a7d2-1a27d1b86590
X-Mailer: Sweego
Message-ID:
 <1787667597.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3@vates.tech>
x-swg-bid: 1787667597.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 25 Aug 2026 16:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ioreq: switch ioreq page allocation to vmap
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <20260420093820.825969-2-julian.vetter@vates.tech>
 <35a08d22-1e95-4e02-a7e9-7f392ef11722@suse.com>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <35a08d22-1e95-4e02-a7e9-7f392ef11722@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2b1e.98ce00ae3019bacf.1a0394ac5bb.43e3200d7ca5731=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787667596738
X-purgate-ID: tlsNG-42698a/1787667599-AB0DD9EA-4E2194C3/0/0
X-purgate-type: clean
X-purgate-size: 6677

---=Part.2b1e.98ce00ae3019bacf.1a0394ac5bb.43e3200d7ca5731=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 8/18/26 3:06 PM, Jan Beulich wrote:
> On 20=2E04=2E2026 11:38, Julian Vetter wrote:
>> Switch the Xen-side ioreq page mapping from prepare_ring_for_helper() /
>> map_domain_page_global() to explicit vmap(), to ensure vmap_to_page()
>> can recover the struct page_info * uniformly during teardown=2E
>=20
> What's after the comma isn't really the main reason for this patch, is i=
t?
> Describing this aspect =2E=2E=2E
>=20
>> This is a prerequisite for multi-page ioreq support: the non-buf ioreq
>> region will need to span multiple pages for domains with more vCPUs tha=
n
>> fit in a single page, and vmap() is the natural interface for contiguou=
s
>> multi-page Xen VA mappings=2E
>>
>> In non-debug builds map_domain_page_global() uses the directmap for low
>> MFNs rather than vmap(), so this change has a small overhead in the
>> common case=2E Debug builds already used vmap() indirectly=2E
>>
>> With both paths using vmap(), vmap_to_page() can recover the struct
>> page_info * uniformly, so drop the 'page' field from struct ioreq_page
>> and update all callers accordingly=2E
>=20
> =2E=2E=2E here (at the bottom) is fully sufficient=2E
>=20
>> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
>> ---
>> Changes in v6:
>> - Updated commit message to clearly specify why these changes are made
>> - Added comment to say that this is {prepare,destroy}_ring_for_helper()
>>    just using vmap_to_page() + v{map,unmap}()
>> - Kept proper ordering in ioreq_server_free_mfn(), first clearing the v=
a
>>    pointer before unmapping
>=20
> Yet then you didn't extend the same consideration =2E=2E=2E
>=20
>> @@ -128,8 +129,13 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_serve=
r *s, bool buf)
>>       if ( gfn_eq(iorp->gfn, INVALID_GFN) )
>>           return;
>>  =20
>> -    destroy_ring_for_helper(&iorp->va, iorp->page);
>> -    iorp->page =3D NULL;
>> +    /* Equivalent to destroy_ring_for_helper(), using vmap_to_page()=
=2E */
>> +    if ( iorp->va )
>> +    {
>> +        put_page_and_type(vmap_to_page(iorp->va));
>> +        vunmap(iorp->va);
>> +        iorp->va =3D NULL;
>> +    }
>=20
> =2E=2E=2E to here=2E (Really we should perhaps introduce VUNMAP(), much =
like we
> have XFREE(), XVFREE(), etc=2E)
>=20
> Further the ordering doesn't match destroy_ring_for_helper(), which unma=
ps
> first and only then drops the page refs=2E
>=20
>> @@ -162,12 +171,40 @@ static int hvm_map_ioreq_gfn(struct ioreq_server =
*s, bool buf)
>>       if ( gfn_eq(iorp->gfn, INVALID_GFN) )
>>           return -ENOMEM;
>>  =20
>> -    rc =3D prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
>> -                                 &iorp->va);
>> -
>> +    /*
>> +     * Equivalent to prepare_ring_for_helper() using vmap()=2E Using v=
map()
>> +     * rather than map_domain_page_global() ensures vmap_to_page() can
>> +     * recover the struct page_info * uniformly at teardown, which is
>> +     * needed to support multi-page ioreq mappings (see nr_ioreq_pages=
())=2E
>> +     */
>=20
> "is needed" is too strong, I think - surely there would be a way to hand=
le
> that without vmap_to_page(), by tracking all struct page_info * separate=
ly=2E
>=20
>> @@ -309,15 +310,16 @@ static int ioreq_server_alloc_mfn(struct ioreq_se=
rver *s, bool buf)
>>   static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
>>   {
>>       struct ioreq_page *iorp =3D buf ? &s->bufioreq : &s->ioreq;
>> -    struct page_info *page =3D iorp->page;
>> +    struct page_info *page;
>> +    void *va;
>>  =20
>> -    if ( !page )
>> +    if ( !iorp->va )
>>           return;
>>  =20
>> -    iorp->page =3D NULL;
>> -
>> -    unmap_domain_page_global(iorp->va);
>> +    va =3D iorp->va;
>=20
> Please can this be the initializer of the variable, for the if() above t=
o
> then use that local var?
>=20
>> @@ -333,7 +335,8 @@ bool is_ioreq_server_page(struct domain *d, const s=
truct page_info *page)
>>  =20
>>       FOR_EACH_IOREQ_SERVER(d, id, s)
>>       {
>> -        if ( (s->ioreq=2Epage =3D=3D page) || (s->bufioreq=2Epage =3D=
=3D page) )
>> +        if ( (s->ioreq=2Eva && vmap_to_page(s->ioreq=2Eva) =3D=3D page=
) ||
>> +             (s->bufioreq=2Eva && vmap_to_page(s->bufioreq=2Eva) =3D=
=3D page) )
>>           {
>>               found =3D true;
>>               break;
>=20
> You mention in the description that some extra overhead is introduced=2E=
 The
> (generally) two page walks done here are particularly concerning=2E Sinc=
e we
> have a valid struct page_info * available here, I wonder if we shouldn't
> aid this lookup by recording the VA in one of struct page_info's fields=
=2E
> Afaics vmap() doesn't use any of the fields, so it should be relatively
> easy to determine a field to use for this purpose=2E The more involved p=
art
> would then be to make sure the field (in other struct page_info instance=
s)
> is also properly different from any VA vmap() may return=2E

Hello Jan,

Thank you again for your feedback! I will wait then for Anthony's=20
decision regarding whether the multi-page ioreq support and the ioreq_t=20
growth should be combined into a single effort, before I proceed further=
=20
with a v7=2E

I just wanted to clarify one thing regarding the overhead I mentioned in=
=20
the first patch's commit message ("this change has a small overhead in=20
the common case")=2E Here, I was referring to vmap()/vunmap() replacing=20
map_domain_page_global()=2E Where map_domain_page_global() has a directmap=
=20
fast path=2E I didn't mean the overhead of the added vmap_to_page()=2E I=
=20
should maybe clarify this better in my next iteration's commit message=2E

On your suggestion to cache the VA in struct page_info to speed up the=20
vmap_to_page() lookups in is_ioreq_server_page(): I looked through the=20
tree, and that function currently has only one caller=20
sh_remove_all_mappings() (in xen/arch/x86/mm/shadow/common=2Ec) and is=20
only reached in a failure case=2E Given that, and given how widely shared=
=20
and size-critical struct page_info is, I'm wondering whether it's really=
=20
worth touching it for the gain of not having to do the 2 lookups=2E What=
=20
do you think?

Thanks,
Julian

>
> Jan



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.2b1e.98ce00ae3019bacf.1a0394ac5bb.43e3200d7ca5731=---

