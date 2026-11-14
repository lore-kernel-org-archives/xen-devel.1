Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5475606A338
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 01:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BClpYWwY
Received: from list by lists.xenproject.org with outflank-mailman.1488397.1690370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xS2x2-0007nt-BV; Sat, 14 Nov 2026 01:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488397.1690370; Sat, 14 Nov 2026 01:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xS2x2-0007nk-71; Sat, 14 Nov 2026 01:53:08 +0000
Received: by outflank-mailman (input) for mailman id 1488397;
 Sat, 14 Nov 2026 01:53:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1xS2x0-0007ne-BF
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 01:53:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xS2wz-00C7tH-8A
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 02:53:05 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6af7bed9-2eae-0a2a0a5409dd-0a2a4508dbfa-20
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 02:53:05 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6af7bf01-f659-0a2a45080019-d1558031bdd6-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 02:53:05 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so12298185e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 17:53:05 -0800 (PST)
Received: from localhost ([139.47.58.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e33ae5bsm171993895e9.3.2026.11.13.17.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 17:53:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794621185; x=1795225985; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UM/Ynpi1uinwPCcXhSyid/Pf66OkyomlvJ2vtoTJ2o=;
        b=BClpYWwYz3/4FzB4gXk6cwBxLENCDTHwgZOVFDRAAj3FvzhZB5kS5xTKWt6eae10Rq
         Z89U4+qPaUpR6TnSm2g6c/cld746Ggo4aSSBy8jq3JyEk3MrPYNKNbbKZZRtx1NhMdkt
         TGMJr/GDRTOaQanmE8NK7qiuJk8vb9sVpC0n+i7bfR8GFaeY8WTJcr171jop39Ef+ajo
         FzCCOzFz96qrjtW8qgvnIRlIIN/7zN5nPhw4zctsm4GpfsYEySAcWPsUC2SLmaC4iBOL
         Bf5vO8lmusxpVyCdlj56C8ykOzwB+t5CyNxmTkiRoHg/kYX+GnWOv8KbfHpPfRCqO0gY
         elYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621185; x=1795225985;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UM/Ynpi1uinwPCcXhSyid/Pf66OkyomlvJ2vtoTJ2o=;
        b=0JAPyb7iWKpwQHTTNzDtf4AAgM5T4jxlDZlSGGoHr8hqXHiGAFoq3vUmpowD5Ftmyy
         7fqJVjvJz/eWy7F8ryRgrUrp1iMvaStI1zNoey93vVXDmSDh+IUgr9K9OgptoZiaHzeF
         A6OxGCnK9xzKczNjOcte/d9Q4fVEZbxVWlj8YtBLTSx9sB36pmidsQlLT6fFGWzmLGkZ
         m+PNs9TrqHhfjg9vYpR83Ism6Ld6y5/IpB6E+S66wg7P4e9iaHRLEickWhNNBctgTCC6
         gQx4BuVVxwWPhKx7f34gVbj/cim/QGuj5ggJqeHwvQH5VcOv0fXFNehgozrAJfCmzlcw
         4RYg==
X-Forwarded-Encrypted: i=1; AL+hErGFOfxRPAcZYHApXb9BTpwRRZx0ufDN/oYYQph/7MjeD3uAJjF9o5tf66rfVtiKezqmoay5KKQqecY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+D1IAUREDJL6nvhItzXWnty9BzYIcNd/rN7vq2JglpmJQLc3OG
	FwH+lIGmW6a+tTKG2sHTyZt0+n5rdnLoRLiHN9DcKdxvUK+ZQHFlKKC/
X-Gm-Gg: AYBFou1XfVEMqpc2qQNQvr7lAnzUMUwKZr38ICTxUN6KgNFHTMNstVHhLgmHA7ggvZM
	4pbj5dCIBbBUC3Lf9F34qZ007S+JXQZlJ+6+Mh5X4z/+dl0vH6ZEwYow4Sv/bFQecBdlHzXcg5a
	b8nsRJ6vOLGjbIW6Pv1UvCE+XUqb5IkNYdKecYp9zDMO8CohmSJbwKupQgfHMIZUktF7jgs7zf4
	ok3o9gZzl6zyA/1K7Ur4hJhMcKczqIZelDvhV7k5fd+p4h7fIX74XbDPeA/FgGR3UhnwLI7zSGr
	aI2w4d3fy7w6A7tFI8ORO4dMIkYyXIpNwsHpr5k27/8BRaPXohYXXN4V/pe5GIwsG2xoZzz9c8j
	EqngCUb3fq0amlXM3pGMsPxjiMfkSePXgFj9H1quMfJas3CIC31IbCfPPRVTc7Z71GPwYa4ljQP
	XH1sPeEQXD+3Kbn6LG8pMLocir17iZJIe8c4z5bQxg4I5tUQFbEC2aORPJ5+Jmt1c1Hz+ETlVl8
	ZtvYyOtqQD1g/8xHz2yN1UjT5dLD7VB92e5B1fKfmN8iPrUtUHsUI0c5rIUhOdXEkawAJWcR7GC
	AzzsG9PRqWD7+5Bq+8W8/2ItQJQ=
X-Received: by 2002:a05:600c:628c:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4bb55a7f827mr92260635e9.21.1794621184533;
        Fri, 13 Nov 2026 17:53:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 02:53:02 +0100
Message-Id: <DMUK45N2J9NG.2YCKA2J80ODD5@gmail.com>
Cc: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4] xen/arm: validate non-common page-table ranges
From: =?utf-8?q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>
To: "Orzel, Michal" <michal.orzel@amd.com>,
 =?utf-8?q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.21.0
References: <20261110145231.7409-1-gabi.qs.mail@gmail.com>
 <f1257512-67cf-481d-a411-2511a3165c5b@amd.com>
In-Reply-To: <f1257512-67cf-481d-a411-2511a3165c5b@amd.com>
X-purgate-ID: tlsNG-c1860d/1794621185-D694287B-8A91D09E/0/0
X-purgate-type: clean
X-purgate-size: 5651
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> There's no need to check for TEMPORARY area. It's only ever used in boot
> pgtables, not in runtime tables. Therefore what we need is just the follo=
wing:
> virt < DOMHEAP_VIRT_START && size <=3D DOMHEAP_VIRT_START - virt
> without any helper.
>
> BTW. This patch breaks Arm32 MPU build. If at all, the helper should be p=
laced
> under mmu/.

Ok, thanks for the review. I was not really sure whether TEMPORARY_AREA was
needed or not, so thanks for making that clear. One thing, though:
`virt < DOMHEAP_VIRT_START && size <=3D DOMHEAP_VIRT_START - virt`

To do that validation in pt.c, I would need to use `#ifdef CONFIG_ARM_32`
instead of `IS_ENABLED()` (which would let DCE drop it on arm64), otherwise=
 it
doesn't build on arm64. That's why I made the xen_pt_range_is_common helper=
. How
should I approach this then? I'll drop `ranges_overlap()` either way, but
should I keep `xen_pt_range_is_common()` and move it under `mmu/`, or just =
drop
all the helpers and use `#ifdef CONFIG_ARM_32` directly in `pt.c`? I assume=
 a
single `#ifdef` in `pt.c` is fine, so I'd go with the second option, as you
suggested. Let me know what you think.

>> +#include <asm/mmu/layout.h>
> Is this needed?

I think I added it while trying to get the helper to build, but I think
it's already pulled in through asm/config.h, so I'll likely drop it in v5.

Best regards,
Gabriel

On Thu Nov 12, 2026 at 3:26 PM CET, Michal Orzel wrote:
>
>
> On 10-Nov-26 15:52, Gabriel Quint=C3=A1ns Souto wrote:
>> On arm32, page-tables are different on each CPUs, although they share so=
me
>> common mappings.
> Please say that the non-common area is the per-CPU domheap mapping.
>
>>=20
>> The xen_pt_update function assumed that only said mappings would be
>> modified, but did not check this assumption.
>>=20
>> Add a range check to reject modifications to non-common mappings.
>>=20
>> Signed-off-by: Gabriel Quint=C3=A1ns Souto <gabi.qs.mail@gmail.com>
>> ---
>> v4:
>>  - Rebased onto staging (v3 was diffed against v2).
>>=20
>> v3:
>>  - Dropped accidentally tracked patch file from commit.
>>=20
>> v2:
>> - Inverted polarity of xen_pt_range_is_non_common() as suggested.
>> - Moved xen_pt_range_is_common() implementation to arch-specific headers
>> (arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried
>> IS_ENABLED() for DCE, but ARM64 lacks definitions for
>> DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).
>> - Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().
>> ---
>>  xen/arch/arm/include/asm/arm32/mm.h | 24 ++++++++++++++++++++++++
>>  xen/arch/arm/include/asm/arm64/mm.h | 10 ++++++++++
>>  xen/arch/arm/mmu/pt.c               | 14 +++++++-------
>>  3 files changed, 41 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/=
asm/arm32/mm.h
>> index 856f2db..c7d09d3 100644
>> --- a/xen/arch/arm/include/asm/arm32/mm.h
>> +++ b/xen/arch/arm/include/asm/arm32/mm.h
>> @@ -16,6 +16,30 @@ static inline bool arch_mfns_in_directmap(unsigned lo=
ng mfn, unsigned long nr)
>>      return false;
>>  }
>> =20
>> +static inline bool ranges_overlap(unsigned long start1, unsigned long s=
ize1,
>> +                           unsigned long start2, unsigned long size2)
>> +{
>> +    if ( start1 < start2 )
>> +        return start2 - start1 < size1;
>> +
>> +    return start1 - start2 < size2;
>> +}
>> +
>> +/*
>> + * On ARM32, page-tables differ between CPUs, so not all mappings are c=
ommon.
>> + */
>> +static inline bool xen_pt_range_is_common(unsigned long virt,
>> +                                       unsigned long size)
>> +{
>> +    unsigned long temporary_start =3D TEMPORARY_AREA_ADDR(0);
> There's no need to check for TEMPORARY area. It's only ever used in boot
> pgtables, not in runtime tables. Therefore what we need is just the follo=
wing:
> virt < DOMHEAP_VIRT_START && size <=3D DOMHEAP_VIRT_START - virt
> without any helper.
>
> BTW. This patch breaks Arm32 MPU build. If at all, the helper should be p=
laced
> under mmu/.
>
>
>> +    unsigned long temporary_size =3D XEN_PT_LEVEL_SIZE(1);
>> +
>> +    return !ranges_overlap(virt, size,
>> +                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) &&
>> +           !ranges_overlap(virt, size,
>> +                          temporary_start, temporary_size);
>> +}
>> +
>>  bool init_domheap_mappings(unsigned int cpu);
>> =20
>>  static inline void arch_setup_page_tables(void)
>> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/=
asm/arm64/mm.h
>> index b4f7545..a3cb56d 100644
>> --- a/xen/arch/arm/include/asm/arm64/mm.h
>> +++ b/xen/arch/arm/include/asm/arm64/mm.h
>> @@ -12,6 +12,16 @@ static inline bool arch_mfns_in_directmap(unsigned lo=
ng mfn, unsigned long nr)
>>      return true;
>>  }
>> =20
>> +/*
>> + * On ARM64, the Xen page-tables are shared by all the CPUs,
>> + * any range is therefore common.
>> + */
>> +static inline bool xen_pt_range_is_common(unsigned long virt,
>> +                                          unsigned long size)
>> +{
>> +    return true;
>> +}
>> +
>>  void arch_setup_page_tables(void);
>> =20
>>  void update_boot_mapping(bool enable);
>> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
>> index 81fe121..42fa79a 100644
>> --- a/xen/arch/arm/mmu/pt.c
>> +++ b/xen/arch/arm/mmu/pt.c
>> @@ -13,6 +13,7 @@
>> =20
>>  #include <asm/current.h>
>>  #include <asm/fixmap.h>
>> +#include <asm/mmu/layout.h>
> Is this needed?
>
> ~Michal


